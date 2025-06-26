{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Debugging tools
    llvmPackages_20.libllvm
  ];
}
