{ config, pkgs, lib, ... }:

{
  imports = [
      ./fonts.nix
      ./doc.nix
      # ../apps/glances-tty.nix
      ../apps/adb.nix
      ../services/printing.nix
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us,ch";
  services.xserver.xkbModel = "pc104";
  # Switch Keyboard Layout with ALT+SHIFT and light up scroll lock when switching
  # use menu key as compose key
  services.xserver.xkbOptions = "terminate:ctrl_alt_bksp,eurosign:e,compose:menu,grp:alt_shift_toggle,grp_led:scroll";

  # Enable networking via network manager,
  # this enables GUI configuration of network connections/WLANs
  networking.networkmanager.enable = true;

  # Enable sound via pulseaudio
  hardware.pulseaudio.enable = true;


  #fthis is required for mounting android phones
  # over mtp://
  services.gvfs.enable = true;
   
  services.dbus.packages = [
     (lib.mkIf config.services.printing.enable pkgs.system-config-printer)
  ];


}
