{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # bind vi to vim because vim_configurable is used and doesn't provide vi
    shellAliases = { vi = "vim"; };
  };
}
