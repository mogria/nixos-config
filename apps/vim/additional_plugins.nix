{ pkgs, ... }:

with pkgs;
let
  buildVimPluginFrom2Nix = pkgs.vimUtils.buildVimPluginFrom2Nix;
in {

  LargeFile = buildVimPluginFrom2Nix { # created by nix#NixDerivation
    name = "LargeFile";
    src = fetchurl {
      url = "http://www.vim.org/scripts/download_script.php?src_id=21106";
      name = "LargeFile.vba.gz";
      sha256 = "1pr27nx53140vixyb3r1x2fpzgn5m64zrx7zgk4mfkqzjq2ajaas";
    };
    buildInputs = [ gzip ];
    dependencies = [];
    meta = {
       homepage = "http://www.vim.org/scripts/script.php?script_id=1506";
    };

    unpackPhase = "gunzip $src";

  };

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
