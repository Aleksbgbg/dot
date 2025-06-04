{pkgs, ...}: {
  programs.zsh = {
    enable = true;

    history.size = 50000;
  };
}
