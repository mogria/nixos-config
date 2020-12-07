{ config, pkgs, ...}:

{
  imports = [
    ./startx.nix
  ];
  # Put the following lines into your .xinitrc:
  # xrdb -merge .Xresources
  # xpmroot ~/background.xpm &
  # "$HOME/bin/xmonad"
  services.xserver.displayManager.sessionCommands = ''
    xmonad &
  '';

  services.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    # extraPackages = [ ];
    # haskellPackages = [ ];
  };
}
