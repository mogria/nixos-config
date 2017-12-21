{ config, pkgs, ... }:

{
  services.upower.enable = true;

  powerManagement.enable = true;
  powerManagement.scsiLinkPolicy = "min_power";
  powerManagement.cpuFreqGovernor = "powersave";

  powerManagement.powerUpCommands = ''
    echo 'min_power' > '/sys/class/scsi_host/host0/link_power_management_policy';
    echo '1500' > '/proc/sys/vm/dirty_writeback_centisecs';
    echo '1' > '/sys/module/snd_hda_intel/parameters/power_save';
    echo 'min_power' > '/sys/class/scsi_host/host1/link_power_management_policy';
    echo 'min_power' > '/sys/class/scsi_host/host2/link_power_management_policy';
    echo 'auto' > '/sys/bus/usb/devices/1-4/power/control';
    echo 'auto' > '/sys/bus/i2c/devices/i2c-3/device/power/control';
    echo 'auto' > '/sys/bus/usb/devices/1-1/power/control';
    echo 'auto' > '/sys/bus/usb/devices/1-5/power/control';
    echo 'auto' > '/sys/bus/i2c/devices/i2c-1/device/power/control';
    echo 'auto' > '/sys/bus/i2c/devices/i2c-2/device/power/control';
    echo 'auto' > '/sys/bus/pci/devices/0000:00:14.0/power/control';
    echo 'auto' > '/sys/bus/pci/devices/0000:00:00.0/power/control';
    echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.3/power/control';
    echo 'auto' > '/sys/bus/pci/devices/0000:00:02.0/power/control';
    echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.4/power/control';
    echo 'auto' > '/sys/bus/pci/devices/0000:00:17.0/power/control';
    echo 'auto' > '/sys/bus/pci/devices/0000:03:00.0/power/control';
    echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.0/power/control';
    echo 'auto' > '/sys/bus/pci/devices/0000:00:16.0/power/control';
    echo 'auto' > '/sys/bus/pci/devices/0000:01:00.0/power/control';
    echo 'auto' > '/sys/bus/pci/devices/0000:04:00.1/power/control';
    echo 'auto' > '/sys/bus/pci/devices/0000:00:14.2/power/control';
    echo 'auto' > '/sys/bus/pci/devices/0000:04:00.0/power/control';
    echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.2/power/control';
    ethtool -s enp4s0f1 wol d;
  '';
}
