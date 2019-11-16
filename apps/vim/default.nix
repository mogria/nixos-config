{lib, pkgs, ... }@args:X
# neovim is marked as broken on Aarch64 release-19.03 due to a 
# issue in luajit. Let's use vim on Aarch64 until neovim is fixed again.
(lib.mkIf pkgs.stdenv.isAarch64 (pkgs.callPackage ./vim.nix {}) ) // 
(lib.mkIf (!pkgs.stdenv.isAarch64) (pkgs.callPackage ./neovim.nix {}) )
