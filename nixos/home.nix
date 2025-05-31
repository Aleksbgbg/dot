{pkgs, ...}: {
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

  home.stateVersion = "25.05";
}
