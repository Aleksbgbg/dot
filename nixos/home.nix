{
  pkgs,
  lib,
  ...
}: {
  home.username = "aleksbgbg";
  home.homeDirectory = "/home/aleksbgbg";

  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    userName = "Aleks Todorov";
    userEmail = "aleks.todorov.1337@gmail.com";
  };

  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;

    extraConfig = lib.fileContents ../nvim/init.vim;
  };
  home.file.".config/nvim/lua/init.lua".text = lib.fileContents ../nvim/init.lua;

  programs.alacritty = {
    enable = true;

    settings = {
      env.TERM = "xterm-256color";

      font = {
        size = 10;
      };

      scrolling.multiplier = 5;

      selection.save_to_clipboard = true;
    };
  };

  home.stateVersion = "25.05";
}
