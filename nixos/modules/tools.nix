{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # git
    git-revise
    git-absorb

    # search & discovery
    ripgrep

    # large-scale edits
    repgrep
  ];
}
