{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "ch";
  services.xserver.xkbVariant = "quertz";
  services.xserver.xkbModel = "pc104";
  services.xserver.xkbOptions = "terminate:ctrl_alt_bksp, eurosign:e";

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3 = {
    enable = true;
  };

  environment.gnome3.excludePackages = [
    pkgs.gnome3.evolution
    pkgs.gnome3.gnome-software
    pkgs.gnome3.vinagre
    pkgs.gnome3.gnome-maps
    pkgs.gnome3.epiphany
  ];
}
