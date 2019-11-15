{ pkgs, ... }:

{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };

    overlays = [
      ( import ./overlays/nix-utils )
      ( import ./overlays/packages.nix )
    ];
  };
}
