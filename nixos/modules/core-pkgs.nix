{pkgs, ...}: {
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
}
