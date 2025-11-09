{
  pkgs,
  nix-index-database,
  ...
}: {
  imports = [
    nix-index-database.nixosModules.nix-index
  ];

  environment.systemPackages = with pkgs; [
    # Source control
    git

    # C compiler toolchain and libraries
    llvmPackages.clangWithLibcAndBasicRtAndLibcxx

    # Make
    gnumake

    # nix formatter
    alejandra

    # Additional Unix utility scripts
    moreutils
  ];

  # Easy package shells
  programs.nix-index-database.comma.enable = true;
}
