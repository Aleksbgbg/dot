{
  pkgs,
  maple,
  ...
}: {
  environment.systemPackages = [
    maple.packages.${pkgs.system}.default
  ];
}
