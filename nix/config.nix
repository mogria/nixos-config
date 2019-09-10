{ config, pkgs, ... }:

{
  nix = {
    useSandbox = true; #might not be required anymore in the future
    buildCores = 16; #might not be required anymore in the future
    maxJobs = 16; #number of cores
    autoOptimiseStore = true;
    readOnlyStore = true;
  };


  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      ( import ./overlays/nvidia.nix )
      ( import ./overlays/nix-utils )
      ( import ./overlays/sudo.nix )
      ( import ./overlays/console-font-tamzen.nix )
    ];
  };
}