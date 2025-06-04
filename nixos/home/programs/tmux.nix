{
  pkgs,
  lib,
  ...
}: {
  programs.tmux = {
    enable = true;

    plugins = with pkgs; [
      tmuxPlugins.nord
    ];

    extraConfig = lib.fileContents ../../../tmux/.tmux.conf;
  };
}
