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
    libreoffice
    evince

    # shell utilities
    moreutils
    patchutils
    binutils
    file
    psmisc

    unzip
    zip

    bc
    xxd

    strace
    ltrace

    pciutils
    iputils
    inetutils
    netcat
    curl
    wget

    # development stuff
    direnv
    git

    # Only install the basic zsh, because of our user configuration
    # The Plugins / completions are all handled by home-manager see:
    #   /home/mogria/.config/nixpkgs/home.nix
    zsh

    manpages
    (import ./vim.nix)
  ];
}
