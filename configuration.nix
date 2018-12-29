# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nixpkgs-config.nix
      ./nix.nix
      ./system-packages.nix
      ./graphical.nix
      ./users.nix
      ./glances-tty.nix
      ./mysql.nix
      ./apache2.nix
      # ./i2p.nix
      ./bluetooth.nix
      # ./zsh.nix
      ./laptop-power.nix
      # ./dhcpd-raspi.nix
      # ./zram-swap.nix
      # ./ilias-mount.nix
      ./fonts.nix
      # ./adb.nix
      ./tmux.nix
      # ./guezzlpage
      # ./listenin.nix
      # ./34c3-cert.nix
      # ./wireguard.nix

      ./searx.nix
    ];

  # boot.enableContainers = true;

  networking.hostName = "voidbook"; # Define your hostname.
  # networking.extraHosts = "127.0.0.1 esther-loeffel";

  networking.firewall.allowedTCPPorts = [ ];
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;
 
  # Select internationalisation properties.
  i18n = {
    # consoleFont = "Lat2-Terminus16"; # set in fonts.nix
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = false;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };

  # Enable automatic updatedb
  services.locate.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;
  # services.printing.browsing = false;
  # services.printing.drivers = [ pkgs.gutenprint ];

  # Enable classic unix at service
  services.atd.enable = true;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.09";

}
