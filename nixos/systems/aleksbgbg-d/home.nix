{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../home/programs/git.nix
  ];

  home.username = "aleksbgbg";
  home.homeDirectory = "/home/aleksbgbg";

  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;

    extraConfig = lib.fileContents ../../../nvim/init.vim;
  };
  home.file.".config/nvim/lua/init.lua".text = lib.fileContents ../../../nvim/init.lua;

  programs.alacritty = {
    enable = true;

    theme = "nord";

    settings = {
      env.TERM = "xterm-256color";

      font = {
        size = 12;
      };

      scrolling.multiplier = 5;

      selection.save_to_clipboard = true;
    };
  };

  programs.tmux = {
    enable = true;

    plugins = with pkgs; [
      tmuxPlugins.nord
    ];

    extraConfig = lib.fileContents ../../../tmux/.tmux.conf;
  };

  programs.obs-studio = {
    enable = true;
  };

  programs.vesktop = {
    enable = true;
  };

  home.stateVersion = "25.05";
}
