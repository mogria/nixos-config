{ config, pkgs, ... }:

{
  services.clamav.daemon.enable = true;
  services.clamav.updater.enable = true;
}
