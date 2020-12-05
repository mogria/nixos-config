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
    # zahir was uid 1007

    marci = {
      isNormalUser = true;
      uid = 1006;
      extraGroups = [ "marci" ] ++ groups.desktopGroups;
      openssh.authorizedKeys.keyFiles = [
        ./keys/marci_acab_ecdsa.pub
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
    "marci" = { gid = 1006; };
    "zahir" = { gid = 1007; };
  };

}
