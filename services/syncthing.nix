{ pkgs, config, ... }:

{
  services.syncthing = {
    enable = true;
    configDir = "/home/syncthing/.config/syncthing";
    dataDir = "/home/syncthing/data";

    # package


    # all_proxy

    group = "syncthing";

    declarative = {
      devices = {
        void = { id = "YBWFQ4K-TYDME37-FCMJPBV-QSPIQ45-GL7WJT4-SBO4NHN-CE5HXUH-3HGQKAW"; addresses = [ "tcp://192.168.1.2" "tcp://void.home" ]; introducer = true; };
        voidbook = { id = "X7M3IX6-J47VWTQ-AAH5CTQ-SSZYVUE-RZJPNF7-JDJZ4PX-QMKPCXC-HX23LQC"; addresses = [ "tcp://voidbook.home" ]; introducer = true; };
        voidphone = { id = "ALXKNUB-MFR2SXS-X56V2PD-572J3NO-K5U5UQN-BP4IFFJ-PYCHZIQ-ZIJGMQ4"; addresses = [ "tcp://voidphone" ]; };
      };

      folders = {
        "/home/syncthing/data/share" = {
          label = "Public Share";
          id = "share";
          devices = [ "void" "voidbook" "voidphone" ];
        };
        "/home/syncthing/data/mogria-private" = {
          label = "mogria-private";
          id = "3a6tf-3jkdn";
          devices = [ "void" "voidbook" "voidphone" ];
        };
        "/home/syncthing/data/Android Camera" = {
          label = "Android Camera";
          id = "lg-h870_uduj-photos";
          devices = [ "void" "voidbook" "voidphone" ];
        };
      };

      overrideFolders = false;
      # overrideDevices = false;
    };

    openDefaultPorts = true; # TCP 22000 for transfer, UDP 21027 for discovery
  };

  # only open ports for file transfers
  # network.firewall.allowedTCPPorts = [ 22000 ];

  # so that all desktop users can access syncthing
  users.users.syncthing.extraGroups = [ "users" ];
}
