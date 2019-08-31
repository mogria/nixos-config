{ config, pkgs, ... }:

{
  imports = [
    ./machines/common/configuration.nix
    ./machines/voidbook/configuration.nix
  ];
}
    
