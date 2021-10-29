{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  # Use this when you don't want to use a display manager
  # like lightdm and start the X server using startx
  # in one of your TTYs
  services.xserver.displayManager.startx.enable = true;

  # environment.systemPackages = with pkgs; [ sx ];
  #environment.systemPackages = with pkgs; [ xorg.xinit ];
}
