{ config, pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    wget
    (import ./vim.nix)
    ((pkgs.callPackage ./nix-home/package.nix) { })
    git
    chromium
    direnv
    wireshark-gtk
    filezilla
    keepass
    thunderbird
    inkscape
    gimp
    transmission_gtk
    psmisc
    libreoffice
    evince
    zsh
    zsh-completions
    zsh-navigation-tools
    nix-zsh-completions
    oh-my-zsh
    discord
    davfs2
  ];
}
