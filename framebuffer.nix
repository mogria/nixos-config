{ config, pkgs, ... }:

{
  # The Linux Documentation Project:
  #   http://tldp.org/HOWTO/Framebuffer-HOWTO/ 

  # Run the following command as root to get the 
  # available resolutions, for the vga= param 
  # $ hwinfo --framebuffer
  #
  # For example a video mode of my NVIDIA card is
  # Mode 0x034a: 1600x1200 (+6400), 24 bit
  boot.vesa = true;

  # The default value is 'auto', set the resolution if needed
  # boot.loader.grub.gfxmodeBios = "1600x1200";
  # boot.loader.grub.gfxmodeEfi = "1600x1200";
}
