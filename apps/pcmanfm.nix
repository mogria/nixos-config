{ config, pkgs, lib, ... }:

let
  package = pkgs.pcmanfm-qt;
in {
  environment.systemPackages = [ package ];
  services.dbus.packages = [ package ];

  # For automounting with pcmanfm https://nixos.wiki/wiki/PCManFM
  services.gvfs.enable = lib.mkDefault true;
  services.udisks2.enable = lib.mkDefault true;
  services.devmon.enable = lib.mkDefault true;

}
