{ config, pkgs, lib, ... }:
{
  # This file installs my faviourite graphical programs.
  # Most of them are gtk based, but there are also some Qt ones 
  # in there.

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    wireshark-qt
    vlc
    firefox
    filezilla
    keepass
    thunderbird
    inkscape
    gimp
    libreoffice
    evince
    (lib.mkIf (!config.services.transmission.enable) transmission_gtk)
  ];
}
