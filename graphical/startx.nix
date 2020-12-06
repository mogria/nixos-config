{ config, pkgs, ... }:

{
  # Use this when you don't want to use a display manager
  # like lightdm and start the X server using startx
  # in one of your TTYs
  services.xserver.displayManager.startx.enable = true;
}
