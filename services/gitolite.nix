{ config, pkgs, ... }:

{
  services.gitolite = {
    enable = true;
    adminPubkey = builtins.readFile ../users/keys/mogria_void_ecdsa.pub;
    dataDir = "/srv/storage/gitolite";
  };
}
