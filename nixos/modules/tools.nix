{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # secret management
    sops

    # git
    git-revise
    git-absorb

    # search & discovery
    ripgrep

    # large-scale edits
    repgrep
  ];
}
