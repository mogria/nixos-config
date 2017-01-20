{ config, pkgs, ... }:

{

  users.enforceIdUniqueness = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.mogria = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = ["wheel" "mogria"];
    shell = pkgs.zsh;
  };

  users.groups = [{ gid = 1000; name = "mogria"; }];

}
