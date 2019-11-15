{ pkgs, ... }:

{
  boot.kernelModules = [ "8821au" ];
  boot.extraModulePackages = with pkgs.linuxPackages; [
    rtl8821au
  ];
}
