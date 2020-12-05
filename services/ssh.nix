{ config, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    /* listenAddresses = [ {
      addr = "127.0.0.1";
      port = 22;
    }]; */
  };
}
