{...}: {
  imports = [
    ../../home/programs/git.nix
    ../../home/programs/neovim.nix
    ../../home/programs/tmux.nix
  ];

  home.username = "aleksbgbg";
  home.homeDirectory = "/home/aleksbgbg";

  home.stateVersion = "25.05";
}
