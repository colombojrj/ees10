% Mascaras para analise
valerio = zeros(1,28);
valerio(1:7) = ones(1,7);
valerio = logical(valerio);

peres = zeros(1,28);
peres(8:14) = ones(1,7);
peres = logical(peres);

king = zeros(1,28);
king (15:21) = ones(1,7);
king = logical(king);

abc = zeros(1,28);
abc(22:28) = ones(1,7);
abc = logical(abc);

% fase em rad
% phase_deg = [-23.0214  -44.5131  -70.5025 -156.5836 -185.9821 -222.1243 -354.2885, -24.0547 -38.3693 -47.3963 -52.0706 -58.4512 -231.7988 -314.8614];
phase_deg = zeros(1,28);

phase_deg(valerio) = [-23.0214  -44.5131  -70.5025 -156.5836 -185.9821 -222.1243 -354.2885];
phase_deg(peres) = [-24.0547 -38.3693 -47.3963 -52.0706 -58.4512 -231.7988 -314.8614];
phase_deg(king) = [-9.488181087366433 -58.871413449692090 -87.731297590431650 -66.838391590986180 -51.680793120800250 -103.6767130289225 -295.3408786402680];
phase_deg(abc) = [0 -48.7472 -88.9775 -93.2769 -72.0598 -161.7274 -263.5606];

phase_rad = deg2rad(phase_deg);

% mod em dB
% abs_value_dB = [3.6929    6.6508   14.7260   20.9019   18.8463    6.0231  -60.0000, 3.5583 4.6350 5.3076 5.8657 6.7323 -3.6017 -60.7352];
abs_value_dB = zeros(1,28);

abs_value_dB(valerio) = [3.6929    6.6508   14.7260   20.9019   18.8463    6.0231  -60.0000];
abs_value_dB(peres) = [ 3.5583 4.6350 5.3076 5.8657 6.7323 -3.6017 -60.7352];
abs_value_dB(king) = [-15.441323085234151 -0.519951259459169 1.552129733007730 2.524411781903840 3.136115686290049 5.915328283554756 -29.767030521747650];
abs_value_dB(abc) = [-1.5227    2.6105    5.5696    2.6105   12.1223   18.5455  -14.1063];
abs_value = 10.^(abs_value_dB /20);

% freqArray = [0.10	0.60	1.20	1.70	2.10	2.50	2.75	3	3.15	3.30	3.45	3.60	3.75	3.85	3.95	4	4.05	4.10	4.15	4.25	4.40	4.70	5	8	10	25	40	60];
% valerio / peres
% freqArray = [ 1.2000    2.7500    3.4500    3.9500    4.1500    5.0000   40.0000, 1.7000     3.0000     3.6000     4.0000      4.2500     8.0000     60.0000];
freqArray = zeros(1,28);
freqArray(valerio) = [1.2000    2.7500    3.4500    3.9500    4.1500    5.0000   40.0000];
freqArray(peres) = [1.7000     3.0000     3.6000     4.0000      4.2500     8.0000     60.0000];
freqArray(king) = [0.6000 2.5000 3.3000 3.8500 4.1000 4.7000 25.0000];
freqArray(abc) =  [0.1  2.1 3.15 3.75 4.05 4.40 10];

Xdata = [freqArray];

output_results = abs_value .* exp(j.*phase_rad);

Ydata = [real(output_results), imag(output_results)];

transfer_function = @(v, freqArrayInput) v(3)./ (( (j.*freqArrayInput).^2 + v(2)*j.*freqArrayInput+ v(1)).*(1/5*j.*freqArrayInput + 1));% 

F_modified=@(v, freqArrayInput) [real(transfer_function(v,Xdata))  imag(transfer_function(v,Xdata))];

% chute inicial dos parametros
v0 = [0.5 1.74 18.02];

opts = optimoptions(@lsqnonlin,'Display','off');
opts = optimoptions(@lsqcurvefit,opts); % reuse the options
lb = [0, 0, 0];
ub = [Inf, Inf, Inf];
[parametros,resnorm] = lsqcurvefit(F_modified,v0,freqArray,Ydata,lb,ub,opts);

alfa = parametros(1)
beta = parametros(2)
gamma = parametros(3)

G = tf([parametros(3)],[1 parametros(2) parametros(1)]) * tf([1],[1/5 1])
[mag,phase,wout] = bode(G);

figure; hold on;
plot(wout(:,:), phase(:,:),'DisplayName','Ajuste', color= "blue")
scatter(freqArray(valerio), phase_deg(valerio),'filled','DisplayName','Valério')
scatter(freqArray(peres), phase_deg(peres),'filled','DisplayName','Peres')
scatter(freqArray(king), phase_deg(king),'filled','DisplayName','Emanuel')
scatter(freqArray(abc), phase_deg(abc),'filled','DisplayName','Pedro')
lgd = legend;
% lgd.NumColumns = 2;
set(gca,'xscale','log')

figure; hold on;
plot(wout(:,:), 20*log10(mag(:,:)),'DisplayName','Ajuste', color= "blue")
scatter(freqArray(valerio), abs_value_dB(valerio),'filled','DisplayName','Valério')
scatter(freqArray(peres), abs_value_dB(peres),'filled','DisplayName','Peres')
scatter(freqArray(king), abs_value_dB(king),'filled','DisplayName','Emanuel')
scatter(freqArray(abc), abs_value_dB(abc),'filled','DisplayName','Pedro')
lgd = legend;
% lgd.NumColumns = 2;
set(gca,'xscale','log')
