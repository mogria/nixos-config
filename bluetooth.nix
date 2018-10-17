{ config, pkgs, ... }:

{
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
}
