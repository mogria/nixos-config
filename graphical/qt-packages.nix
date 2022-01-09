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
    qutebrowser
    clementine
    firefox
    libreoffice-qt
    hunspellDicts.en_US-large
    hunspellDicts.en_GB-ise
    hunspellDicts.de_CH
    hunspellDicts.de_DE
    hunspellDicts.fr-moderne

    (lib.mkIf (!config.services.transmission.enable) transmission-qt)

    # let's have all the graphics programs
    krita
    gimp
    inkscape
  ];
}
