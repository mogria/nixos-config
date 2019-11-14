{ config, pkgs, lib, ... }:

{
  # NixOS wants to enable GRUB by default
  boot.loader.grub.enable = false;

  # A bunch of boot parameters needed for optimal runtime on RPi 3b+
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.initrd.checkJournalingFS = false; # no fsck on startup
  environment.systemPackages = with pkgs; [
  # File systems configuration for using the installer's partition layout
  fileSystems = {
    "/boot" = {
      device = "/dev/sda1";
      fsType = "ext2";
    };
    "/" = {
      device = "/dev/sda2";
      fsType = "ext4";
    };
  };

  boot.cleanTmpDir = true;

  # make the WIFI chiip work (wlan0)
  hardware.enableRedistributableFirmware = true;

  # Use 1GB of additional swap memory in order to not run out of memory
  # when installing lots of things while running other things at the same time.
  swapDevices = [ { device = "/swapfile"; size = 1024; } ];
}
