
{ config, pkgs, lib, ... }:

{
  imports = [
    ./desktop.nix
  ];

  services.xserver.displayManager = {
    lightdm.enable = true;
    autoLogin = {
      enable = true;
      user = "mogria";
    };
  };

  # services.xserver.displayManager.startx.enable = true;

  services.xserver.desktopManager.xfce = {
    enable = true;
    thunarPlugins = [
      pkgs.xfce.thunar-archive-plugin
      pkgs.xfce.thunar-dropbox-plugin
    ];
  };

  # this is required for mounting android phones
  # over mtp://
  services.gvfs.enable = true;

  # services.udev.packages = [ pkgs.gnome3.gnome_settings_daemon ];

  environment.systemPackages = [
    # XFCE plugins
    pkgs.xfce.xfce4-systemload-plugin
    pkgs.xfce.xfce4-weather-plugin
    pkgs.xfce.xfce4-whiskermenu-plugin
    # pkgs.xfce.xfce4-timer-plugin
    pkgs.xfce.xfce4-clipman-plugin
    pkgs.xfce.xfce4-taskmanager

    # scanning
    pkgs.gnome3.simple-scan

    # Required to run to load kdeconnect: 
    #   qdbus org.kde.kded /kded loadModule kdeconnect
    # on startup
    # pkgs.qt5.qttools
    # pkgs.kdeconnect
    # pkgs.kde-cli-tools
  ];

  services.dbus.packages = [
    # this is required or else a warning appears on XFCE startup
    # that no service for blueman has been found,...
    (lib.mkIf config.hardware.bluetooth.enable pkgs.blueman)

    #   required to load kdeconnect, for kdeinit5
    # pkgs.kdeFrameworks.kdbusaddons
  ];

  # Enable the GNOME Desktop Environment.
  # services.xserver.desktopManager.gnome3 = {
  #   enable = true;
  # };

  # environment.gnome3.excludePackages = [
  #   pkgs.gnome3.evolution
  #   pkgs.gnome3.gnome-software
  #   pkgs.gnome3.vinagre
  #   pkgs.gnome3.gnome-maps
  #   pkgs.gnome3.epiphany
  # ];
}
