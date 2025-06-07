{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # git
    git-revise

    # search & discovery
    ripgrep

    # large-scale edits
    repgrep
  ];
}
