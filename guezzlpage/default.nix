{ config, pkgs, ... }:

{
  imports =
    [
      ./onion-service.nix
      ./httpd.nix
      ./storage.nix
    ];
}
