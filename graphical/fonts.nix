{ config, pkgs, ... }:

{
  fonts = {
    # fontDir = {
    #   enable = true;
    # };
    fontconfig = {
      enable = true;
      antialias = true;
      hinting.enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "Monoid HalfTight Semi-Condensed" "Source Code Pro For Powerline" "Roboto Mono" "DejaVu Sans Mono" ];
        sansSerif = [ "Monoid HalfTight Semi-Condensed" "Roboto Regular" "DejaVu Sans" ];
        serif = [ "Roboto Slab Regular" "DejaVu Serif" ];
      };
	
      # allow bitmap fonts
      allowBitmaps = true;
      # e.g. for Calibro
      useEmbeddedBitmaps = true;
    };
    enableDefaultFonts = true;
    fonts = with pkgs; [
      anonymousPro
      arkpandora_ttf
      caladea
      carlito
      comfortaa
      comic-relief
      crimson
      dejavu_fonts
      # google-fonts
      inconsolata
      liberationsansnarrow
      liberation_ttf
      libertine
      mononoki
      montserrat
      norwester-font
      opensans-ttf
      powerline-fonts
      roboto
      sampradaya
      source-code-pro
      source-sans-pro
      source-serif-pro
      tai-ahom
      tempora_lgc
      terminus_font
      theano
      ubuntu_font_family
      corefonts
      monoid
    ];
  };

  console = {
    font = "TamzenForPowerline8x16";
    packages = [ pkgs.tamzen-console-font ];
  };
}
