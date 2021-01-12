# My NixOS Configuration


This is my configuration of all the NixOS machines I own.
This configuration can be is used on multiple NixOS machines & some part of the configuration is shared between all of them.

## Installation

Every machine has it's own congiuration file in the `machines/` subfolder of this repository. You may want to create your own based off these files for your own machine. Just copy one of the machine files:

  * `machines/voidbook` acer laptop with NVIDIA graphics card
  * `machines/void` desktop with old NVIDIA graphics card
  * `machines/noroute` raspberry pi rifi/lan router

They are managedby the cloning this repository into `/etc/nixos` & adjusting `/etc/nixos/configuration.nix` to use the correct machine file.
After this I just run

    nixos-rebuild switch

This configuration repository has no support for nix-ops as of now.

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
 
