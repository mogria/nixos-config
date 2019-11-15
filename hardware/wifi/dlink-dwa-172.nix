{ pkgs, options, ... }:

{
  boot.kernelModules = [ "8821au" ];
  boot.extraModulePackages = with options.boot.kernelPackages; [
    rtl8821au
  ];

  nixpkgs.overlays = [
    import ../../nix/overlays/rtl8821au.nix
  ];
}
