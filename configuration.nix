{ config, pkgs, ... }:

{
  imports = [
    ./machines/void/configuration.nix

    ./nix/config.nix
    ./system-packages.nix
    # ./../../graphical/xfce-desktop.nix
    ./users/users.nix
    ./apps/glances-tty.nix
    ./services/printing.nix
    ./services/ssh.nix
    # ./services/i2p.nix
    # ./services/bluetooth.nix
    # ./laptop/laptop-power.nix
    # ./dhcpd-raspi.nix
    # ./ilias-mount.nix
    ./graphical/fonts.nix
    ./apps/adb.nix
    ./apps/tmux.nix
    # ./guezzlpage
    # ./listenin.nix
    # ./34c3-cert.nix
    # ./wireguard.nix

    # ./services/searx/default.nix
    ./services/docker.nix
    ./sudo.nix
    ./zram-swap.nix
    # ./mongo.nix
  ];


  programs.command-not-found.enable = true;

  networking.networkmanager.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Zurich";


  # Select internationalisation properties.
  i18n = {
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Enable automatic updatedb
  services.locate.enable = true;

  # Enable classic unix at service
  services.atd.enable = true;

  boot.supportedFilesystems = [ "vfat" "ntfs" ];
}
    
