{ config, pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    nix-utils
    wireshark-gtk
    vlc
    filezilla
    keepass
    thunderbird
    inkscape
    gimp
    transmission_gtk
    psmisc
    libreoffice
    evince

    # shell / development stuff
    wget
    direnv
    git
    zsh
    zsh-completions
    zsh-navigation-tools
    nix-zsh-completions
    oh-my-zsh
    (import ./vim.nix)
    # discord
  ];
}
