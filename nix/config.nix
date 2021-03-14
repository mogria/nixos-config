{ config, pkgs, ... }:

{
  imports = [
    ./nixpkgs-config.nix
    ./mogpkgs.nix
    ./gc.nix
  ];
  nix = {
    useSandbox = true; #might not be required anymore in the future
    buildCores = 16; #might not be required anymore in the future
    maxJobs = 16; #number of cores
    autoOptimiseStore = true;
    readOnlyStore = true;
  };
}
