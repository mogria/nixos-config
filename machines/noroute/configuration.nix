{ config, pkgs, lib, ... }:
{
  imports = [
    ../../graphical/framebuffer.nix
    ../../services/wifi-hotspot.nix
    ../../services/dhcpd-raspi.nix
    ../../services/wol-forward.nix
  ];

  networking.hostName = "noroute";
  networking.wireless = {
    enable = true;
    interfaces = [ "wlan0" ];
    networks = {
      "CISCO 1457" = { psk = builtins.readFile /.wlan-psk; };
    };
    userControlled.enable = true;
  };
  hardware.enableRedistributableFirmware = true;

  # NixOS wants to enable GRUB by default
  boot.loader.grub.enable = false;

  # if you have a Raspberry Pi 2 or 3, pick this:
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # A bunch of boot parameters needed for optimal runtime on RPi 3b+
  boot.kernelParams = ["cma=256M"];
  boot.loader.raspberryPi.enable = true;
  boot.loader.raspberryPi.version = 3;
  boot.loader.raspberryPi.uboot.enable = true;
  boot.loader.raspberryPi.firmwareConfig = ''
    gpu_mem=256
  '';
  environment.systemPackages = with pkgs; [
    raspberrypi-tools
  ];

  # File systems configuration for using the installer's partition layout
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/NIXOS_BOOT";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };
  };

  # Preserve space by sacrificing documentation and history
  services.nixosManual.enable = false;
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 30d";
  boot.cleanTmpDir = true;

  # Configure basic SSH access
  services.openssh.permitRootLogin = "yes";

  # Use 1GB of additional swap memory in order to not run out of memory
  # when installing lots of things while running other things at the same time.
  swapDevices = [ { device = "/swapfile"; size = 1024; } ];

}
