{ config, pkgs, ... }:

{
  imports = [
    ./nix/config.nix
    ./machines/void/configuration.nix

    ./headless/packages.nix
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
    ./sudo.nix
    ./zram-swap.nix
    # ./mongo.nix
  ];

  programs.command-not-found.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Zurich";


  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  # use us keyboard on tty's
  console.keyMap = "us";

  # Enable automatic updatedb
  services.locate.enable = true;

  # Enable classic unix at service
  services.atd.enable = true;

  boot.supportedFilesystems = [ "vfat" "ntfs" ];
}
    
