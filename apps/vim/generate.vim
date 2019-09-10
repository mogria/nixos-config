" generate.vim: Taken from the nixpkgs manual Section Frameworks.Vim
" Modifications:
"  - Support NIX_PATH like these:
"    nixpkgs=/some/dir:nixos=/someother/dir:/some/random/dir
ActivateAddons
let vim_scripts = "additional_plugins_list"
call nix#ExportPluginsForNix({
            \ 'path_to_nixpkgs': eval('{'.substitute(substitute(':'.$NIX_PATH, ':/[^=:]*', '', 'g'), ':\([^=]\+\)=\([^:=]*\)', '"\1":"\2",', 'g').'}')["nixpkgs"],
            \ 'cache_file': '/tmp/vim2nix-cache',
            \ 'try_catch': 0,
            \ 'plugin_dictionaries': ["vim-addon-manager"]+map(readfile(vim_scripts), 'eval(v:val)')
            \ })
