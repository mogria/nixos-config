{ config, pkgs, ... }:

let
  id = 999;
  user = "venus";
in {
  services.venus = {
    ownerEmail = "m0gr14@gmail.com";
    ownerName = "Mogria";
    inherit user;
  };

  users.extraUsers = {
    "${user}" = {
      uid = id;
    };
  };

  users.groups.venus = {
    gid = id;
  };
}
