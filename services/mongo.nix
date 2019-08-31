{ config, pkgs, lib, ... }:

{
  services.mongodb= {
    enable = true;
  };
}
