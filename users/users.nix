{ config, pkgs, ... }:

let
  groups = import ./groups.nix;
in {

  imports = [
    ./minimal.nix

    # use home-manger for user configuration
    ./home-manager.nix
  ];

  # Define a user account. Don't forget to set a password with passwd.
  users.extraUsers = {
    # user 'mogria' is already defined in ./minimal.nix

    # loraine was uid 1001
    # marci  was uid 1006
    # zahir was uid 1007

    luca = {
      isNormalUser = true;
      uid = 1008;
      extraGroups = [ "luca" ] ++ groups.desktopGroups;
      openssh.authorizedKeys.keyFiles = [
        ./keys/luca_ux303lab_ecdsa.pub
      ];
    };

    guest = {
      isNormalUser = true;
      uid = 1005;
      extraGroups = [ "guest" ] ++ groups.printerGroups;
    };
  };

  users.groups = {
    "guest" = { gid = 1005; };
    "luca" = { gid = 1008; };
  };

}
