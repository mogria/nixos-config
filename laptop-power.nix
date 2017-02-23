{ config, pkgs, ... }:

{
  services.upower.enable = true;

  powerManagement.enable = true;
  powerManagement.scsiLinkPolicy = "min_power";
  powerManagement.cpuFreqGovernor = "ondemand";

  powerManagement.powerUpCommands = ''
    echo '1' > '/sys/module/snd_hda_intel/parameters/power_save'
    echo '1500' > '/proc/sys/vm/dirty_writeback_centisecs'
    echo 'auto' > '/sys/bus/i2c/devices/i2c-2/device/power/control'
    echo 'auto' > '/sys/bus/usb/devices/4-1.6/power/control'
    echo 'auto' > '/sys/bus/i2c/devices/i2c-0/device/power/control'
    echo 'auto' > '/sys/bus/i2c/devices/i2c-1/device/power/control'
    echo 'auto' > '/sys/bus/i2c/devices/i2c-3/device/power/control'
    echo 'auto' > '/sys/bus/i2c/devices/i2c-4/device/power/control'
    echo 'auto' > '/sys/bus/i2c/devices/i2c-5/device/power/control'
    echo 'auto' > '/sys/bus/i2c/devices/i2c-6/device/power/control'
    echo 'auto' > '/sys/bus/i2c/devices/i2c-7/device/power/control'
    echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.2/power/control'
    echo 'auto' > '/sys/bus/pci/devices/0000:00:1c.0/power/control'
    echo 'auto' > '/sys/bus/pci/devices/0000:00:02.0/power/control'
    echo 'auto' > '/sys/bus/pci/devices/0000:00:04.0/power/control'
    echo 'auto' > '/sys/bus/pci/devices/0000:00:14.0/power/control'
    echo 'auto' > '/sys/bus/pci/devices/0000:00:16.0/power/control'
    echo 'auto' > '/sys/bus/pci/devices/0000:00:1a.0/power/control'
    echo 'auto' > '/sys/bus/pci/devices/0000:00:1b.0/power/control'
    echo 'auto' > '/sys/bus/pci/devices/0000:00:1d.0/power/control'
    echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.0/power/control'
    echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.3/power/control'
    echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.6/power/control'
    echo 'auto' > '/sys/bus/pci/devices/0000:02:00.0/power/control'
    echo 'auto' > '/sys/bus/pci/devices/0000:00:00.0/power/control'
    echo 'auto' > '/sys/bus/pci/devices/0000:00:1c.1/power/control'
  '';
}
