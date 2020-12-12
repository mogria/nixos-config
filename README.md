# My NixOS Configuration


This configuration can be is used on multiple NixOS machines.
Every machine has it's own congiuration file in the `machines/` subfolder of this repository.

They are managedby the cloning this repository into `/etc/nixos` & adjusting `/etc/nixos/configuration.nix` to use the correct machine file.
After this I just run

    nixos-rebuild switch

## Features

Includes configuration for

 * XFCE 4.14 Desktop
 * Mate Desktop
 * Headless (no desktop enviroment)
 * Hardware configuration for Laptops & NVIDIA Graphics cards
 * Various Example Configuration for various services
   * SSH
   * Transmission-Web
   * nginx / mysql / php
   * newsboat
   * Gitolite
   * Searx
   * Tor Hidden Service using containerized `systemd-nspawn`
 
