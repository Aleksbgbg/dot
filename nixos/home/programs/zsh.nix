{
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;

    history.size = 50000;

    plugins = [
      {
        name = "zsh-vi-mode";
        file = "zsh-vi-mode.plugin.zsh";
        src = fetchGit {
          url = "https://github.com/Aleksbgbg/zsh-vi-mode";
          rev = "e3fb2715161440a1c37df29169530cad3615600a";
        };
      }
    ];

    initContent = lib.fileContents ./vi.zsh;
  };
}
