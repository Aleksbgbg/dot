{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git-revise
  ];
}
