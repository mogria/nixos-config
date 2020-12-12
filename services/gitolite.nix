{ config, pkgs, ... }:

{
  # Use this git command to add a remote repo
  # $ git remote add origin  gitolite@void.home:$repo_name.git 
  #
  # The gitolite-admin repo contains the server configuration & a push will apply it.
  services.gitolite = {
    enable = true;
    adminPubkey = builtins.readFile ../users/keys/mogria_void_ecdsa.pub;
    dataDir = "/srv/storage/gitolite";
  };
}
