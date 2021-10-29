
{ config, pkgs, ... }:
{
  imports = [
    ../apps/vim/vim.nix
  ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # lots of unix  shell utilities
    moreutils
    binutils
    file
    psmisc
    netcat
    curl
    wget

    # admin utils
    lsb-release
    pciutils
    iputils
    powertop

    # development environment
    patchutils
    nix-utils
    nix-index # provides nix-index & nix-locate
    direnv
    git
    # Only install the basic zsh, because of our user configuration
    # The Plugins / completions are all handled by home-manager see:
    #   /home/mogria/.config/nixpkgs/home.nix
    zsh
    manpages
    jq
    ripgrep
    fd
    exa
    w3m

    nixops
  ];
}
