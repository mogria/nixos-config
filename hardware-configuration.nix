{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_usb_sdmmc" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.mitigateDMAAttacks = true;
  boot.initrd.luks.devices = {
    luksroot = { name = "luksroot"; device = "/dev/disk/by-uuid/243b1824-2cc2-40ac-a5f8-0fbb3294db5d"; allowDiscards = true; };
    # swap = { name = "swap"; device = "/dev/disk/by-uuid/f1d2eb76-b397-4efa-94fc-d1bd37c4f847"; allowDiscards = true; };
  }; 

  fileSystems = [{
    mountPoint = "/boot";
    label = "boot";
    device = "/dev/disk/by-uuid/FCD7-4831";
    fsType = "vfat";
  } {
    mountPoint = "/";
    label = "luksroot";
    device = "/dev/mapper/luksroot";
    fsType = "ext4";
    options = ["noatime" "nodiratime" "discard"];
  } {
    mountPoint = "/tmp";
    device = "tmpfs";
    fsType = "tmpfs";
    options = ["nosuid" "nodev" "relatime"];
  } {
    label = "encryptedswap";
    device = "/dev/sda2";
    fsType = "none";
    options = ["noauto"];
  }
  ];

  swapDevices = [{
    device = "/dev/mapper/swap";
    encrypted = {
      enable = true;
      blkDev = "/dev/disk/by-uuid/f1d2eb76-b397-4efa-94fc-d1bd37c4f847";
      keyFile = "/mnt-root/.swapkey";
      label = "swap";
    };
    priority = 5;
  }];

  nix.maxJobs = lib.mkDefault 4;
}
