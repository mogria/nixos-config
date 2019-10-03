{ config, pkgs, ... }:

{
  users.enforceIdUniqueness = true;


  # single user 'mogria'
  users.extraUsers.mogria = {
      isNormalUser = true;
      uid = 1000;
      extraGroups = [ "wheel" "mogria" ];
      openssh.authorizedKeys.keyFiles = [
        ./keys/mogria_voidbook_ecdsa.pub
        ./keys/mogria_void_ecdsa.pub
      ];
      shell = pkgs.zsh;
  };

  users.extraUsers.root= {
    openssh.authorizedKeys.keyFiles = [
      ./keys/nixops.pub
    ];
  };

  users.groups = [
    { gid = 1000; name = "mogria"; }
  ];
}
