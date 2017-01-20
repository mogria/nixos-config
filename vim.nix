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

    " open and close nerd tree automatically
    autocmd VimEnter * NERDTree
    function! s:CloseIfOnlyControlWinLeft()
      if winnr("$") != 1
        return
      endif
      if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
            \ || &buftype == 'quickfix'
        q
      endif
    endfunction
    augroup CloseIfOnlyControlWinLeft
      au!
      au BufEnter * call s:CloseIfOnlyControlWinLeft()
    augroup END

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
        "The_NERD_tree"
        "vundle"
        "vim-addon-php-manual"
        "vim-easy-align"
      ];
    }
  ];
}
