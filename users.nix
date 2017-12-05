{ config, pkgs, ... }:

{

  users.enforceIdUniqueness = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers = {
    mogria = {
      isNormalUser = true;
      uid = 1000;
      extraGroups = ["wheel" "mogria" "davfs2"];
      shell = pkgs.zsh;
    };

    loraine = {
      isNormalUser = true;
      uid = 1001;
      extraGroups = ["loraine"];
    };

    guest = {
      isNormalUser = true;
      uid = 1005;
      extraGroups = ["guest"];
    };
  };

  users.groups = [{ gid = 1000; name = "mogria"; } { gid = 1001; name = "loraine"; } { gid = 1005; name = "guest"; }];

}
