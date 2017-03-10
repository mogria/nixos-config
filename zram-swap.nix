{ config, pkgs, ... }:

{
  zramSwap = {
    enable = true;
    memoryPercent = 40;
    numDevices = 4;
    priority = 10;
  };
}
