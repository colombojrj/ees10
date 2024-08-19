out = array2table(zeros(5,8), "VariableNames", ["Entrada", "Equilíbrio (rad)", "Sobressinal (rad)", "Overshoot", "$\omega_n", "$\xi$", "$\alpha$", "$\beta$"]);

for i = 1:5
    data = getfield(load(compose("u%d.mat",5 * i)),"ans");
    t = data(1, :);
    u = data(2, :) * pi / 180;

    [max_u, max_idx] = max(u);
    tp = t(max_idx) - 15;
    yss = mean(u(30000:end));
    M = max_u / yss - 1;
    xi = sqrt(log(M)^2/(pi^2 + log(M)^2));
    wn = pi/(tp * sqrt(1 - xi^2));
    alpha = wn^2;
    beta = 2 * xi * wn;

    out(i,:) = {5 * i, yss, max_u, M, wn, xi, alpha, beta};
end

write(out, "out.csv")