{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    shortcut = "q"; 
    terminal = "screen-256color";
  };
}
