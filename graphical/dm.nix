{ config, pkgs, ... }:

{
  services.xserver.displayManager = {
    lightdm.enable = true;
    autoLogin = {
      enable = true;
      user = "mogria";
    };
  };
}
