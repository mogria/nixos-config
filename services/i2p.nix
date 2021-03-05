{ config, pkgs, ... }:

{
  services.i2pd = {
    enable = true;

    # addressbook = {
      # defaulturl = 
      # subscriptions
    # };
    bandwidth = 100; # limit bandwidth in KBbs (if not set it's 32 KBps)
    # dataDir = /var/i2pdata;
    exploratory = {
      inbound = {
        length = 3;
        quantity = 10;
      };
      outbound = {
        length = 3;
        quantity = 10;
      };
    };
    family = "mognet";

    # uncomment if router is unrachable and needs introduction nodes
    # floodfill = true;

    # ifname = ;
    # ifname4 = ;
    # ifname6 = ;

    # serve something on I2P forward port
    # inTunnels = {
    #   "name" = {
    #     enable = true;
    #     accessList = []; # nodes allowed to connect
    #     address = "127.0.0.1";
    #   };
    # };


    #limits = {
    #  coreSize = ;
    #};
  };
}
