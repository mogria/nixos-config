{ config, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./graphical/xfce-desktop.nix
    # ../../graphical/framebuffer.nix
    # ../../services/wifi-hotspot.nix
    # ../../services/dhcpd-raspi.nix
    # ../../services/wol-forward.nix
    ../../users/minimal.nix
  ];

  networking.hostName = "nixdows-vm";
}
