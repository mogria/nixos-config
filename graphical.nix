{ config, pkgs, lib, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbModel = "pc104";
  services.xserver.xkbOptions = "terminate:ctrl_alt_bksp, eurosign:e";

  # services.xserver.displayManager.slim = {
    # enable = true;
    # this is how you would specify your slim theme, but nixos has changed
    # to lightdm anyway soo....
    # theme = pkgs.writeTextFile {
    # name = "slim-theme";
    #  text = ''
    #  '';
    # };
  # };
  services.xserver.displayManager.lightdm = {
    enable = true;
    autoLogin = {
      enable = true;
      user = "mogria";
    };
  };
  services.xserver.desktopManager.xfce = {
    enable = true;
    thunarPlugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-dropbox-plugin
    ];
  };

  services.xserver.updateDbusEnvironment = true;

  services.gnome3 = {
    # this is required for mounting android phones
    # over mtp://
    gvfs.enable = true;
  };

  # services.udev.packages = [ pkgs.gnome3.gnome_settings_daemon ];

  environment.systemPackages = [
    # XFCE plugins
    pkgs.xfce.xfce4-systemload-plugin
    pkgs.xfce.xfce4-weather-plugin
    pkgs.xfce.xfce4-whiskermenu-plugin
    # pkgs.xfce.xfce4-timer-plugin
    pkgs.xfce.xfce4-clipman-plugin
  ];

  /* may not be required anymore, testing...
   environment.variables.GIO_EXTRA_MODULES = [ "${lib.getLib pkgs.gnome3.dconf}/lib/gio/modules"
                                             "${pkgs.gnome3.glib_networking.out}/lib/gio/modules"
                                             "${pkgs.gnome3.gvfs}/lib/gio/modules" ]; */

  services.dbus.packages = [
    # never printed but this might be useful
    (lib.mkIf config.services.printing.enable pkgs.system-config-printer)

    # this is required or else a warning appears on XFCE startup
    # that no service for blueman has been found,...
    (lib.mkIf config.hardware.bluetooth.enable pkgs.blueman)
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
