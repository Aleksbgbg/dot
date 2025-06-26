{...}: {
  imports = [
    ../../home/programs/git.nix
    ../../home/programs/neovim.nix
    ../../home/programs/tmux.nix
    ../../home/programs/zsh.nix
    ../../home/programs/fzf.nix
    ../../home/programs/fd.nix
    ../../home/programs/eza.nix
  ];

  home.username = "aleksbgbg";
  home.homeDirectory = "/home/aleksbgbg";

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

  programs.obs-studio = {
    enable = true;
  };

  programs.vesktop = {
    enable = true;
  };

  home.stateVersion = "25.05";
}
