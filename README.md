
# Laboratório de EES-10/2023

Sejam bem vindos ao repositório com os códigos que utilizaremos nesse semestre.

## Dependências

Fazer controle em tempo real de maneira correta exige muito cuidado. Para evitar ficar "reinventando a roda", nosso código tem dependências e nesta seção vou explicar quais. Estou assumindo que você usa Microsoft Windows. Caso não seja esse o caso, por favor me procure para eu ajudá-lo a instalar os programas no seu computador. Baixe e instale o:

 - [ ] Versionador de código [GIT](https://git-scm.com/download) (next, next, next, install)
 - [ ] Gerenciador de compilação [CMake](https://cmake.org/download/) (next, next, next, install)
 - [ ] Compilador de C/C++ [Microsoft Visual Studio Community](https://visualstudio.microsoft.com/pt-br/) (certifique-se de selecionar a opção "Desenvolvimento para Desktop com C/C++" e então next, next, next, install)

![Marque a opção "Desenvolvimento para Desktop com C/C++"](https://learn.microsoft.com/en-us/cpp/build/media/vscpp-concierge-choose-workload.gif?view=msvc-170)

 - [ ] Biblioteca [Boost C++ v1.82](https://sourceforge.net/projects/boost/files/boost-binaries/1.82.0/boost_1_82_0-msvc-14.3-64.exe/download) (next, next, next, install e **NÃO ALTERE O LOCAL DA INSTALAÇÃO**)
 - [ ] ~~Biblioteca [HDF5](https://www.hdfgroup.org/downloads/hdf5/) (next, next, next, install e **NÃO ALTERE O LOCAL DA INSTALAÇÃO**)~~
 - [ ] Biblioteca [HDF5](https://1drv.ms/u/s!Ag-AoBEZ9F0Vg8FNwnrTrTu7iRIf3w?e=50vhDR) (next, next, next, install e **NÃO ALTERE O LOCAL DA INSTALAÇÃO**)

> Atenção! Não usem a versão 1.14.2 da HDF5 pois a matio não suporta essa versão. Por favor usem o link acima!

## Inicializando o código

Depois de tudo instalado, você pode inicializar o código no seu computador. Assista o vídeo a seguir com o passo-a-passo.

[![Watch the video](https://img.freepik.com/vetores-premium/pagina-de-perfil-do-player-de-video-do-youtube-canal-do-blogger-modelo-de-interface-do-usuario-ux-do-site_73903-324.jpg)](https://youtu.be/wiP100gNqGI)

## Programas que eu uso

- Para editar LaTeX: [Kile](https://kile.sourceforge.io/download.php) + [Miktex](https://miktex.org/download)
- Para editar as figuras: [Inkscape](https://inkscape.org/pt-br/)
- Para escrever com a caneta wacom: [Xournal++](https://xournalpp.github.io/)
- Para gravar os vídeo tutoriais: [OBS Studio](https://obsproject.com/pt-br/download/)
- Para editar os vídeos: [kdenlive](https://kdenlive.org/en/download/)

## Solução de problemas

### O meu visual studio reclama sobre um arquivo libs\lib.obj que não existe

Esse problema é devido à versão da HDF5. A solução é:

1. remover a HDF5 que você instalou
2. instalar a HDF5 disponível neste [link aqui (basicamente a versão 1.14.1)](https://1drv.ms/u/s!Ag-AoBEZ9F0Vg8FNwnrTrTu7iRIf3w?e=50vhDR)
3. deletar a pasta ees10 (sem dó nem piedade)
4. clonar de novo este repositório e repetir o procedimento de configuração (cmake configure, cmake generate, compilar o projeto lab1)

Muito obrigado ao Emanuel por relatar, identificar e resolver esse problema.
