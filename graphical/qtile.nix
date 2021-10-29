{ config, pkgs, lib, ... }:

with lib;

{
  imports = [
    ./qt-packages.nix
    ./desktop.nix
    ../apps/pcmanfm.nix
  ];

  services = {
    xserver = {
      displayManager = {
        defaultSession = "plasma5+qtile";
        autoLogin = {
          user = "mogria";
        };
	    sddm = {
          enable = true;
          enableHidpi = true;
          # theme = "dasd";
        };
        session = [ {
          manage = "desktop";
          name = "qtile-mogria";
          start = ''
            export XDG_CONFIG_HOME="\$\{XDG_CONFIG_HOME:-$HOME/.config\}"
            ${pkgs.libsForQt5.kservice}/bin/kuildsycoca5 

            pcmanfm-qt -d &
            qtile &
            waitPID=$!
          '';
        } ];
        # setupCommands = startplasma;

      };

      windowManager.qtile.enable = true;
      updateDbusEnvironment = true;


      desktopManager = {
       # xterm.enable = true;
       plasma5 = {
         enable = true;
         phononBackend = "gstreamer";
         supportDDC = true;
       };
      };
      # Enable GTK applications to load SVG icons
      gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
      libinput.enable = mkDefault true;
    };

  };


  environment.systemPackages = with pkgs; (
      with libsForQt5; [
        kservice
        kconfig
        knotifyconfig
        kconfigwidgets
        frameworkintegration
        kdbusaddons
        kinit
        kio
        knotifications
        kservice
      ]) ++ (with plasma5Packages; [
        kscreen
        kscreenlocker
        ark

        # Desktop Integration
        akonadi
        akonadi-calendar
        akonadi-contacts
        akonadi-mime
        akonadi-notes
        akregator
        appstream-qt
        qtstyleplugin-kvantum
        
        kde-gtk-config
      ]) ++ [

    # Music Player
    clementine

  ];

  # nixpkgs.config.firefox.enablePlasmaBrowserIntegration = true;

  services.udisks2.enable = true;
  services.upower.enable = true;

  services.udev.packages = [
    pkgs.libmtp
    pkgs.media-player-info
  ];

  programs.qt5ct.enable = true;
  programs.ssh.askPassword = mkDefault "${pkgs.plasma5Packages.ksshaskpass.out}/bin/ksshaskpass";

  security.pam.services.sddm.enableKwallet = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals =  [ pkgs.plasma5Packages.xdg-desktop-portal-kde ];

 
}
