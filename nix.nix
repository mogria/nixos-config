{ config, pkgs, ... }:

{
  nix.useSandbox = true;

  nixpkgs.overlays = [
    ( import ./overlays/nvidia.nix )
    ( import ./overlays/nix-utils )
  ];
}
