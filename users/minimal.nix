{ config, pkgs, ... }:

let
  groups = import ./groups.nix;
in {
  users.enforceIdUniqueness = true;


  # single user 'mogria'
  users.extraUsers.mogria = {
      isNormalUser = true;
      uid = 1000;
      extraGroups = [ "mogria" ] ++ groups.adminGroups ++ groups.desktopGroups;
      openssh.authorizedKeys.keyFiles = [
        ./keys/mogria_voidbook_ecdsa.pub
        ./keys/mogria_void_ecdsa.pub
        ./keys/mogria_voidphone.pub
      ];
      shell = pkgs.zsh;
  };

  users.extraUsers.root= {
    openssh.authorizedKeys.keyFiles = [
      ./keys/nixops.pub
    ];
  };

  users.groups."mogria" = { gid = 1000; name = "mogria"; members = [ "mogria" ]; };
}
