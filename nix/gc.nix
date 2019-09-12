{ config, pkgs, lib, ... }:

{
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 30d";
}
