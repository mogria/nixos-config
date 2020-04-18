
{ config, pkgs, ... }:

{
  # there's also hardware/firmware/all.nix
  # if you want to give it a shot
  hardware.enableRedistributableFirmware = true;

}
