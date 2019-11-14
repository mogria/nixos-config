{ config, pkgs, lib, ... }:

{
  virtualisation.virtualbox.guest.enable = true;

  # A bunch of boot parameters needed for optimal runtime on RPi 3b+

  boot.loader.systemd-boot.enable = true;
  boot.initrd.checkJournalingFS = false; # no fsck on startup

  # File systems configuration for using the installer's partition layout
  fileSystems = {
    "/boot" = {
      device = "/dev/sda3";
      fsType = "fat";
      neededForBoot = true;
    };
    "/" = {
      device = "/dev/sda1";
      fsType = "ext4";
    };
  };

  swapDevices = [{
    device = "/dev/sda2";
  }];

  boot.cleanTmpDir = true;
}
