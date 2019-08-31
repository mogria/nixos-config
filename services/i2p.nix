{ config, pkgs, ... }:

{
  services.i2p.enable = true;
  services.i2pd = {
    enable = true;
  };
}
