{ config, pkgs, lib, ... }:

let
  vimpkg = pkgs.vim_configurable.customize {
      name = "vim";
      
      vimrcConfig.customRC = builtins.readFile ./vimrc;

      vimrcConfig.vam.knownPlugins = pkgs.vimPlugins // (pkgs.callPackage ./additional_plugins.nix {});
      vimrcConfig.vam.pluginDictionaries = [
        { names = [
            "vundle"
            "vim-nix"
            "vim-addon-vim2nix"
            "vim-vinegar"
            "vim-surround"
            "vim-fugitive"
            "vim-rhubarb"
            "vim-eunuch"
            "vim-closetag"
            "endwise"
          ];
        }
      ];
    };
in {
  environment.systemPackages = [ vimpkg ];
  programs.vim.defaultEditor = true;
}
