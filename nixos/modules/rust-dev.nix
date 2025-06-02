{
  pkgs,
  rust-overlay,
  ...
}: {
  nixpkgs.overlays = [rust-overlay.overlays.default];
  environment.systemPackages = with pkgs; [
    (rust-bin.selectLatestNightlyWith (toolchain: toolchain.complete))
    cargo-watch
  ];
}
