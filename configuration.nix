# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./machines/void/configuration.nix
      ./nixpkgs-config.nix
      ./nix.nix
      ./system-packages.nix
      # ./graphical/xfce-desktop.nix
      ./users/users.nix
      ./apps/glances-tty.nix
      # ./services/mysql.nix
      # ./services/postgres.nix
      ./services/printing.nix
      ./services/venus.nix
      # ./services/ssh.nix
      # ./services/i2p.nix
      # ./services/bluetooth.nix
      # ./laptop/laptop-power.nix
      # ./dhcpd-raspi.nix
      # ./zram-swap.nix
      # ./ilias-mount.nix
      ./graphical/fonts.nix
      ./apps/adb.nix
      ./apps/tmux.nix
      # ./guezzlpage
      # ./listenin.nix
      # ./34c3-cert.nix
      # ./wireguard.nix

      # ./services/searx/default.nix
      # ./services/docker.nix
      ./sudo.nix
      # ./mongo.nix
    ];

  # boot.enableContainers = true;

  # Enable automatic updatedb
  services.locate.enable = true;

  # Enable classic unix at service
  services.atd.enable = true;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "18.03";

}
