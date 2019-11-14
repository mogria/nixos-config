{ config, pkgs, lib, ... }:

{
  imports = [ ];

  # A bunch of boot parameters needed for optimal runtime on RPi 3b+

  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
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

  nix.maxJobs = lib.mkDefault 1;
  virtualisation.virtualbox.guest.enable = true;

  security.rngd.enable = false; // otherwise vm will not boot
}
