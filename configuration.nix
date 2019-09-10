{ config, pkgs, ... }:

{
  imports = [
    ./machines/void/configuration.nix

    ./nix/config.nix
    ./headless/packages.nix
    # ./../../graphical/xfce-desktop.nix
    ./services/ssh.nix
    # ./services/i2p.nix
    # ./services/bluetooth.nix
    # ./laptop/laptop-power.nix
    # ./dhcpd-raspi.nix
    # ./ilias-mount.nix
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
    
