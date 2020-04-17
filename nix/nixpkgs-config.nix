{ pkgs, ... }:

{
  nixpkgs = {
    config = {
      allowUnfree = true; # allow proprietary software / drivers (required for nvidia drivers)
      # allowUnsupportedSystem = true; # for building the raspberry pi from an other NixOS machine
      # allowBroken = true; # for trying to build a broken package
    };

    overlays = [
      ( import ./overlays/nix-utils )
      ( import ./overlays/packages.nix )
    ];
  };
}
