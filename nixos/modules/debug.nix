{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Debugging tools
    llvmPackages.libllvm
  ];
}
