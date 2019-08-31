{ config, pkgs, ... }:

let 
  /* you can generate these commands using powertop */
  powersaveCommands = ''
    ${pkgs.powertop} --auto-tune

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
