{ config, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    /* listenAddresses = [ {
      addr = "192.168.43.124";
      port = 50022;
    }]; */
  };
}
