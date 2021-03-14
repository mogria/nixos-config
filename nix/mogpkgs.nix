{ config, pkgs, ... }:

let
  mogpkgs = import (builtins.fetchTarball https://github.com/mogria/mogpkgs/archive/release-20.09.tar.gz);
in {
  nix.binaryCachePublicKeys = [ ];
  nix.binaryCaches = [
  ];
}
