{ config, pkgs, ... }:

{
  imports = [
    ./framebuffer.nix
  ];

  boot.plymouth = {
    enable = true;
  };
}
