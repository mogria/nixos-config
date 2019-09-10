{ pkgs, ... }:

let
  buildVimPluginFrom2Nix = pkgs.vimUtils.buildVimPluginFrom2Nix;
  fetchgit = pkgs.fetchgit;
in {
  endwise = buildVimPluginFrom2Nix { # created by nix#NixDerivation
    name = "endwise-2018-12-26";
    src = fetchgit {
      url = "git://github.com/tpope/vim-endwise";
      rev = "f67d022169bd04d3c000f47b1c03bfcbc4209470";
      sha256 = "0lq2sphh2mfciva184b4b3if202hr4yls4d2gzbjx7ibch45zb9i";
    };
    dependencies = [];

  };
}
