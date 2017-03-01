# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nixpkgs-config.nix
      ./system-packages.nix
      ./graphical.nix
      ./users.nix
      ./mysql.nix
      ./apache2.nix
      ./clamav.nix
      ./i2p.nix
      ./bluetooth.nix
      ./zsh.nix
      ./laptop-power.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "voidbook"; # Define your hostname.
  networking.extraHosts = "127.0.0.1 esther-loeffel";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
 
  systemd.generators = { "systemd-gpt-auto-generator" = "/dev/null"; };
  # systemd.generator-packages = [ pkgs.systemd-cryptsetup-generator ];

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "de_CH-latin1";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable automatic updatedb
  services.locate.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";

}
