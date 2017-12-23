with import <nixpkgs> {};

vim_configurable.customize {
  name = "vim";
  
  vimrcConfig.customRC = ''
    set nocompatible
    syntax enable
    set smartindent
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set number
    set hlsearch

    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

    if filereadable($HOME."/.vimrc")
      source $HOME/.vimrc
    endif
  '';

  vimrcConfig.vam.knownPlugins = pkgs.vimPlugins;
  vimrcConfig.vam.pluginDictionaries = [
    { names = [
        "ctrlp"
        "vundle"
        "vim-addon-php-manual"
        "vim-easy-align"
      ];
    }
  ];
}
