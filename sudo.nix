{ config, pkgs, lib, ... }:

{
  security.sudo.extraConfig = ''
    Defaults insults
  '';
}
