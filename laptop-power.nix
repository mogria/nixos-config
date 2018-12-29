{ config, pkgs, ... }:

let 
  /* you can generate these commands using powertop */
  powersaveCommands = ''
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
    # echo 'auto' > /sys/devices/pci0000:00/0000:00:17.0/ata1/host0/target0:0:0/0:0:0:0/power/control
    # echo 'auto' > /sys/devices/pci0000:00/0000:00:17.0/ata1/power/control
    # echo 'auto' > /sys/devices/pci0000:00/0000:00:17.0/ata2/power/control
    # echo 'auto' > /sys/devices/pci0000:00/0000:00:17.0/ata3/host2/target2:0:0/2:0:0:0/power/control
    # echo 'auto' > /sys/devices/pci0000:00/0000:00:17.0/ata3/power/control

    ${pkgs.ethtool}/bin/ethtool -s enp4s0f1 wol d;
    ${pkgs.ethtool}/bin/ethtool -s wlp3s0 wol d;
    echo Y > /sys/module/iwlwifi/parameters/power_save
    ${pkgs.hdparm}/bin/hdparm -S 10 -B 255 /dev/disk/by-id/ata-Micron_1100_MTFDDAV256TBN_1711166AC81F
    ${pkgs.hdparm}/bin/hdparm -S 10 -B 255 /dev/disk/by-uuid/c0232ce6-9bef-43ea-b873-a9acec0e382e
  '';
  
in {
  services.upower.enable = true;
  services.tlp.enable = true;
  hardware.sensor.iio.enable = true;

  powerManagement = {
    enable = true;
    powerUpCommands = powersaveCommands;
    resumeCommands = powersaveCommands;
  };


}
