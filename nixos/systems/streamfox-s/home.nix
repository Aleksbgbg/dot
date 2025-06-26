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

  home.stateVersion = "25.05";
}
