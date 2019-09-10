{ config, pkgs, lib, ... }:

let
  vimpkg = pkgs.neovim.override {
    configure = {
      customRC = ./builtins.readFile ./vimrc;
      plug.plugins = with pkgs.vimPlugins; [
        vim-nix
        vim-addon-vim2nix
        vim-vinegar
        vim-surround
        vim-fugitive
        vim-rhubarb
        vim-eunuch
        vim-closetag
        /*
        "vim-ripgrep"
        "vim-endwise"
        "vim-closer"
        */
      ];
    };
  };
in {
  environment.systemPackages = [ vimpkg ];
  environment.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };  
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
