{ config, pkgs, ... }:

{
  imports = [
    ./nixpkgs-config.nix
    ./gc.nix
  ];
  nix = {
    useSandbox = true; #might not be required anymore in the future
    maxJobs = 4; #number of cores
    autoOptimiseStore = true;
    readOnlyStore = true;

    # trustedBinaryCaches = [
      # "http://cache.nixos.org"
    # ];
  };
}
