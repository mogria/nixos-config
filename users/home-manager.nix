{ pkgs, config, ... }:

{
  # add home-manager support
  # requires the following: nix channel 
  # $ nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
  # See: https://rycee.gitlab.io/home-manager/
  imports = [ <home-manager/nixos> ];

  # Uncomment to install user packages into /etc/profiles instad of ~/.nix-profile, required for `nixos-rebuild build-vm`
  # home-manager.useUserPackages = true;

  # Removes multiple instances of nixpkgs for home-manger.
  # Saves evaluation time & makes the whole setup more reproducible and based on the same nixpkgs as NixOS is.
  # Additionally no configuration of is NIX_PATH needed on NixOS for home-manager.
  home-manager.useGlobalPkgs = true;
}
