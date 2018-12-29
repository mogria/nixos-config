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
    pkgs.xfce.xfce4-taskmanager

    # Required to run to load kdeconnect: 
    #   qdbus org.kde.kded /kded loadModule kdeconnect
    # on startup
    pkgs.qt5.qttools
    pkgs.kdeconnect
    pkgs.kde-cli-tools
  ];

  # Open ports for KDE Connect
  networking.firewall.allowedTCPPorts = [
                        1714 1715 1716 1717 1718 1719
    1720 1721 1722 1723 1724 1725 1726 1727 1728 1729
    1730 1731 1732 1733 1734 1735 1736 1737 1738 1739
    1740 1741 1742 1743 1744 1745 1746 1747 1748 1749
    1750 1751 1752 1753 1754 1755 1756 1757 1758 1759
    1760 1761 1762 1763 1764
  ];
  networking.firewall.allowedUDPPorts = [
                        1714 1715 1716 1717 1718 1719
    1720 1721 1722 1723 1724 1725 1726 1727 1728 1729
    1730 1731 1732 1733 1734 1735 1736 1737 1738 1739
    1740 1741 1742 1743 1744 1745 1746 1747 1748 1749
    1750 1751 1752 1753 1754 1755 1756 1757 1758 1759
    1760 1761 1762 1763 1764
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

    #   required to load kdeconnect, for kdeinit5
    pkgs.kdeFrameworks.kdbusaddons
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
