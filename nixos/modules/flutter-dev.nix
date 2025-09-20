{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    flutter

    # Should already be installed, but after flutter is installed, clang can't
    # link with `-lc++` without this...?
    llvmPackages.clang
  ];
}
