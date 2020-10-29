{ pkgs, config, ... }:

{
  documentation = {
    man = {
      enable = true;
      # make `apropos` work
      generateCaches = true;
    };
  };
}
