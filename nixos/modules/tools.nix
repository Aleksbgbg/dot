{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # git
    git-revise

    # search & discovery
    ripgrep
  ];
}
