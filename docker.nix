{ config, pkgs, lib, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };
}
