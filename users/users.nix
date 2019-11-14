{ config, pkgs, ... }:

let
  groups = import ./groups.nix;
in {

  imports = [
    ./minimal.nix
  ];

  # Define a user account. Don't forget to set a password with passwd.
  users.extraUsers = {
    # user 'mogria' is already defined in ./minimal.nix

    # loraine was uid 1001

    marci = {
      isNormalUser = true;
      uid = 1006;
      extraGroups = [ "marci" ] ++ groups.desktopGroups;
      openssh.authorizedKeys.keyFiles = [
        ./keys/marci_acab_ecdsa.pub
      ];
    };

    zahir = {
      isNormalUser = true;
      uid = 1007;
      extraGroups = [ "zahir" ] ++ groups.desktopGroups;
    };

    guest = {
      isNormalUser = true;
      uid = 1005;
      extraGroups = [ "guest" ] ++ groups.printerGroups;
    };
  };

  users.groups = [
    { gid = 1005; name = "guest"; }
    { gid = 1006; name = "marci"; }
    { gid = 1007; name = "zahir"; }
  ];

}
