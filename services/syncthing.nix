{ pkgs, config, ... }:

let
    user = "syncthing"
    dataDir = "/home/${user}/data";
    devices = {
      void = { id = "YBWFQ4K-TYDME37-FCMJPBV-QSPIQ45-GL7WJT4-SBO4NHN-CE5HXUH-3HGQKAW"; addresses = [ "tcp://192.168.1.2" "tcp://void.home" ]; introducer = true; };
      voidbook = { id = "X7M3IX6-J47VWTQ-AAH5CTQ-SSZYVUE-RZJPNF7-JDJZ4PX-QMKPCXC-HX23LQC"; addresses = [ "tcp://voidbook.home" ]; };
      voidphone = { id = "ALXKNUB-MFR2SXS-X56V2PD-572J3NO-K5U5UQN-BP4IFFJ-PYCHZIQ-ZIJGMQ4"; addresses = [ "tcp://voidphone.home" ]; };
      pixel4e = { id = "66TC76B-HN7Z7KV-KL4DHDC-SQ2P2E5-3IQMIK3-NL5RIGP-QOLDQLE-JKOD5AD"; addresses = [ "tcp://pixi.home" ]; };
    };
    deviceNames = builtins.attrNames devices;

in {
  services.syncthing = {
    enable = true;
    configDir = "/home/${user}/.config/syncthing";
    inherit dataDir;

    # all_proxy
    inherit user;
    group = "users";

    declarative = {
      inherit devices;

      folders = {
        "${dataDir}/share" = {
          label = "Public Share";
          id = "share";
          devices = deviceNames;
        };
        "${dataDir}/mogria-private" = {
          label = "mogria-private";
          id = "3a6tf-3jkdn";
          devices = deviceNames;
        };
	"${dataDir}/archive" = {
          label = "archive";
          id = "KPtFm88hHk";
          devices = deviceNames;
	};
        "/home/mogria/Music" = {
          label = "Music";
          id = "pckpd-j4nad";
          devices = deviceNames;
        };
        "${dataDir}/Android Camera" = {
          label = "Android Camera";
          id = "lg-h870_uduj-photos";
          devices = deviceNames;
        };
        "${dataDir}/Syncthing Camera" = {
          label = "Syncthing Camera";
          id = "syncthingAndroidCamera-52x89-60es4";
          devices = deviceNames;
        };
        "${dataDir}/old-dropbox" = {
          label = "Android Camera";
          id = "lg-h870_uduj-photos";
          devices = deviceNames;
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
  users.users.syncthing.extraGroups = [ "syncthing" "users" ];
}
