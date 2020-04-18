# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

let
  ssd = "/dev/disk/by-id/ata-Micron_1100_MTFDDAV256TBN_1711166AC81F";
  encryptedRoot = "/dev/disk/by-uuid/3fcf8cef-09af-46b5-9ec9-f4f2409afb7e";
  hdd = "/dev/disk/by-uuid/c0232ce6-9bef-43ea-b873-a9acec0e382e";
in {
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
      ../../hardware/razer.nix
      ../../hardware/nvidia.nix
    ];

  boot.initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  };

  /* driver displaylink requires linux < 5.3, linux_latest is 5.4 and I experienced some breakage anyway (sdcard). */
  /* boot.kernelPackages = pkgs.linuxPackages_latest; */
  boot.extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ] ++ (with config.boot.kernelPackages; [ cpupower bbswitch x86_energy_perf_policy ]);
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  boot.initrd.luks.mitigateDMAAttacks = true;
  boot.initrd.luks.devices = {
    luks00ssd = {
      device = encryptedRoot;
      allowDiscards = true;
      preLVM = true;
    };
  };

  boot.tmpOnTmpfs = true;

  # make sure the second hard disk gets decrypted
  # by the key lying on the ssd, so mount it temporaily
  boot.initrd.preLVMCommands = lib.mkAfter ''
    echo Trying to get hddkey from the encrypted SSD
    mkdir /mnt-getkey
    wait_target "device" /dev/mapper/luks00ssd
    mount -r -t ext4 /dev/mapper/luks00ssd /mnt-getkey || echo Couldnt mount SSD to get the key
    wait_target "key file" /mnt-getkey/.hddkey
    echo Trying to unlock
    cryptsetup open --key-file /mnt-getkey/.hddkey ${hdd} luks01hdd || echo Unlocking failed
    echo unmounting
    umount /mnt-getkey
    rmdir /mnt-getkey
  '';

  fileSystems."/" =
    { device = "/dev/mapper/luks00ssd";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/NIXOS_BOOT";
      fsType = "vfat";
    };

  fileSystems."/home" =
    { device = "/dev/mapper/hdddata-home";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/mapper/hdddata-swap"; }
    ];

  nix.maxJobs = lib.mkDefault 8;
}
