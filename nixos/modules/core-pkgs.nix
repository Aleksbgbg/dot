{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Source control
    git

    # C compiler toolchain and libraries
    llvmPackages_20.clangWithLibcAndBasicRtAndLibcxx

    # nix formatter
    alejandra
  ];
}
