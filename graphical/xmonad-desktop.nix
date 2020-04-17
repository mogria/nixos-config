{ config, pkgs, ...}:

# Make sure to install xmonad on your own
# this module doesn't install it as I install xmonad via home-manager
{
  imports = [
    ./xfce-desktop.nix
  ];
  # Put the following lines into your .xinitrc:
  # xrdb -merge .Xresources
  # xpmroot ~/background.xpm &
  # "$HOME/bin/xmonad"
  #
  # # just use this if you don't want to use the xfce desktop components with xmonad as wm
  # # Xmonad is actually installed and managed by home-manager
  # services.xserver.displayManager.startx.enable = true;

  services.xserver.displayManager.sessionCommands = ''
    xmonad &
  '';
  services.xserver.desktopManager.xfce4-14 = {
    enableXfwm = false;
  };
}
