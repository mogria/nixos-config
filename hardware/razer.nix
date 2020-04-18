{ config, pkgs, ... }:

{
  hardware.openrazer= {
    enable = true;
    keyStatistics = true;
  };
}
