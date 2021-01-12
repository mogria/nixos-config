{ config, pkgs, lib, ...}:
 
# This is all based upon X11, because I for some reason only own NVIDIA cards,
# and it will take some time before NVIDIA supports something newer (with decent drivers).
# In this time wayland will hopefully be mature enough.
{

  imports = [
  ../nvidia.nix
  ];

  # dpi of the most lowest resolution screen:
  services.xserver.dpi = 96;

  # Most of the xorg.conf including the  BusId's
  # for the devices are already defined in the
  # nvidia.nix module. So we just add some more
  # info.
  services.xserver = {
    # display number, e.g. let DISPLAY=:0
    # display = 0;


    # Unfortonately we can only configure one graphics
    # card driver here, but there are two cards in the
    # laptop and the configuration generated was wrong.
    deviceSection = ''
      VendorName "NVIDIA Corporation"
    '';

    screenSection = ''
    '';

# Section "Device"
#   Identifier "Device-nvidia[0]"
#   Driver "nvidia"
#
#  - it should resolve tearing, but 
#   
#   
#   BusID "PCI:1:0:0"
# 
# 
#   
# EndSection
#
# Section "Device"
#   Identifier "nvidia-optimus-intel"
#   Driver "modesetting"
#   BusID  "PCI:0:2:0"
#   Option "AccelMethod" "none"
# EndSection
# 
#
# Section "Screen"
#   Identifier "Screen-nvidia[0]"
#   Device "Device-nvidia[0]"
# 
#   
#   Option "RandRRotation" "on"
# Option "AllowEmptyInitialConfiguration"
# 
# EndSection


# Section "Device"
#   Identifier "nvidia-optimus-intel"
#   Driver "modesetting"
#   BusID  "PCI:0:2:0"
#   Option "AccelMethod" "none"
# EndSection
/*   extraConfig = ''
	Section "Screen"
	  Identifier "nvidia-optimus-intel"
	  Device "Device-nvidia[0]"
	  
	  Option "RandRRotation" "on"
	  Option "AllowEmptyInitialConfiguration"
	EndSection
    '';
*/

  };
}


# Section "Files"
# 
#   FontPath "/nix/store/n89ppnd5hxs5b3bv3afxxa36dsqb4pw7-terminus-font-4.48/share/fonts/terminus"
#   FontPath "/nix/store/7b28cj3a5nw62gscqjby8y2lanrhjb9p-font-bh-lucidatypewriter-100dpi-1.0.3/lib/X11/fonts/100dpi"
#   FontPath "/nix/store/1m9g728l8a3igg1549w8rnspd6zc2yij-font-bh-lucidatypewriter-75dpi-1.0.3/lib/X11/fonts/75dpi"
#   FontPath "/nix/store/v3qg4npz52r3pc0pl4n5v8lrhry6ahrn-font-bh-100dpi-1.0.3/lib/X11/fonts/100dpi"
#   FontPath "/nix/store/xlqr8fxw9yray8z4129j00xyd5fznb6p-font-misc-misc-1.1.2/lib/X11/fonts/misc"
#   FontPath "/nix/store/b6gpkm6kxyz471j1h70102lr1xz6s74p-font-cursor-misc-1.0.3/lib/X11/fonts/misc"
#   FontPath "/nix/store/nyx1r5a0vnw0s84p8nh1mqcln89rm3rl-unifont-12.1.03/share/fonts"
#   FontPath "/nix/store/rxgdzi1l3v4gxq4nyb4cl41nqa5zbsq7-font-adobe-100dpi-1.0.3/lib/X11/fonts/100dpi"
#   FontPath "/nix/store/8fs5jxm67qi2xm891xis5yj0xl2yi7f4-font-adobe-75dpi-1.0.3/lib/X11/fonts/75dpi"
#   ModulePath "/nix/store/4275shr769nad1d8aamyzij74g1x2b4s-nvidia-x11-440.36-4.19.115-bin/lib/xorg/modules/drivers"
#   ModulePath "/nix/store/4275shr769nad1d8aamyzij74g1x2b4s-nvidia-x11-440.36-4.19.115-bin/lib/xorg/modules/extensions"
#   ModulePath "/nix/store/z927pbwkkwagg0lx4imiyfip1jkxpy5j-xorg-server-1.20.5/lib/xorg/modules"
#   ModulePath "/nix/store/z927pbwkkwagg0lx4imiyfip1jkxpy5j-xorg-server-1.20.5/lib/xorg/modules/drivers"
#   ModulePath "/nix/store/z927pbwkkwagg0lx4imiyfip1jkxpy5j-xorg-server-1.20.5/lib/xorg/modules/extensions"
#   ModulePath "/nix/store/ajxc0vw1rifbh56v6nya8lc053mn0bw6-xf86-input-evdev-2.10.6/lib/xorg/modules/input"
#   ModulePath "/nix/store/i1mysgfg8fgh358igh78wq8qaz5cqaiw-xf86-input-libinput-0.28.2/lib/xorg/modules/input"
# EndSection
# Section "ServerFlags"
#   Option "AllowMouseOpenFail" "on"
#   Option "DontZap" "on"
#   
# EndSection
# 
# Section "Module"
#   
# EndSection
# 
# Section "Monitor"
#   Identifier "Monitor[0]"
#   
# EndSection
# 
# # Additional "InputClass" sections
# 
# 
# 
# Section "ServerLayout"
#   Identifier "Layout[all]"
#   Inactive "nvidia-optimus-intel"
# 
#   # Reference the Screen sections for each driver.  This will
#   # cause the X server to try each in turn.
#   Screen "Screen-nvidia[0]"
# 
# EndSection
# 
# 
# 
# # For each supported driver, add a "Device" and "Screen"
# # section.
# 
# Section "Device"
#   Identifier "Device-nvidia[0]"
#   Driver "nvidia"
#   
#   
#   BusID "PCI:1:0:0"
# 
# 
#   
# EndSection
# 
# 
# 
# Section "Device"
#   Identifier "nvidia-optimus-intel"
#   Driver "modesetting"
#   BusID  "PCI:0:2:0"
#   Option "AccelMethod" "none"
# EndSection
# 
# 
# # Automatically enable the libinput driver for all touchpads.
# Section "InputClass"
#   Identifier "libinputConfiguration"
#   MatchIsTouchpad "on"
#   
#   Driver "libinput"
#   Option "AccelProfile" "adaptive"
#   
#   
#   
#   
#   Option "LeftHanded" "off"
#   Option "MiddleEmulation" "on"
#   Option "NaturalScrolling" "off"
#   
#   Option "ScrollMethod" "twofinger"
#   Option "HorizontalScrolling" "on"
#   Option "SendEventsMode" "enabled"
#   Option "Tapping" "on"
#   Option "TappingDragLock" "on"
#   Option "DisableWhileTyping" "off"
#   
# EndSection
