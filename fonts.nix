{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = true;
    enableFontDir = true;
    fonts = [
      pkgs.anonymousPro
      pkgs.arkpandora_ttf
      pkgs.caladea
      pkgs.carlito
      pkgs.comfortaa
      pkgs.comic-relief
      pkgs.crimson
      pkgs.dejavu_fonts
      pkgs.dejavu_fonts
      pkgs.google-fonts
      pkgs.inconsolata
      pkgs.liberationsansnarrow
      pkgs.liberation_ttf
      pkgs.libertine
      pkgs.mononoki
      pkgs.montserrat
      pkgs.norwester-font
      pkgs.opensans-ttf
      pkgs.pecita
      pkgs.powerline-fonts
      pkgs.roboto
      pkgs.sampradaya
      pkgs.source-code-pro
      pkgs.source-sans-pro
      pkgs.source-serif-pro
      pkgs.tai-ahom
      pkgs.tempora_lgc
      pkgs.terminus_font
      pkgs.theano
      pkgs.ubuntu_font_family
      pkgs.vistafonts
    ];
  };
}
