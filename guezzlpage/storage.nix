{ config, pkgs, ... }:

let
  deployScript = pkgs.writeScript "post-receive" ''
      #!${pkgs.bash}/bin/bash
      set -x
      dir="$(mktemp -d)"
      cd "$dir";
      # make symlink for nix-shell, it's the same executable as nix-build
      ln -s "${pkgs.nix}/bin/nix-build" nix-shell
      ${pkgs.git}/bin/git clone file:///srv/git/guezzlpage.git --single-branch --branch=production --depth 1
      cd guezzlpage
      rev="$(${pkgs.git}/bin/git rev-parse production)"
      if [ ! -f /srv/web/guezzlpage/version ] || [ "$rev" != "$(cat /srv/web/guezzlpage/version)" ]; then
        echo "$rev" > /srv/web/guezzlpage/version
        ../nix-shell --run 'jekyll build'
        rm -rf /srv/web/guezzlpage/* || true
        mkdir /srv/web/guezzlpage
        cp -R _site/* /srv/web/guezzlpage
        [ 0 -eq "${EUID:-1000}" ] && chown -R git:git /srv/web/guezzlpage
      fi
      rm -rf "$dir"
  '';
in {

  networking.networkmanager.unmanaged = [ "interface-name:ve-*" ];

  fileSystems.guezzlwebroot = {
    label = "guezzlweb";
    mountPoint = "/srv/web/guezzlpage";
    device = "tmpfs";
    fsType = "tmpfs";
  };

  containers.guezzlstore = {
    privateNetwork = true;
    hostAddress = "192.168.200.1";
    localAddress = "192.168.200.2";


    bindMounts = {
      "/srv/web/guezzlpage" = {
        hostPath = "/srv/web/guezzlpage";
        isReadOnly = false;
      };
    };

    config = {

      environment.systemPackages = [
        pkgs.git
      ];

      services.gitDaemon = {
        enable = true;
        basePath = "/srv/git";
        listenAddress = "192.168.200.2";
        repositories = [ "/srv/git" ];
      };

      networking = {
        firewall = {
          enable = true;
          allowedTCPPorts = [ 9418 ];
        };
        defaultGateway = {
          interface = "eth0";
          address = "192.168.200.1";
        };
      };

      systemd.services = {

        "git-daemon" = {
          environment = {
            HOME = "/home/git";
            /* for nix-shell/nix-build to work correctly */
            NIX_REMOTE = "daemon";
            NIX_PATH = "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos";
            NIX_BUILD_SHELL = "${pkgs.bash}/bin/bash";
            PATH = "/run/current-system/sw/bin";
          };
          preStart = ''
            if [ ! -d /srv/git ]; then
              mkdir -p /srv/git
              [ ! -d /srv/git/guezzlpage.git ] && \
                ${pkgs.git}/bin/git init --bare /srv/git/guezzlpage.git
                touch /srv/git/guezzlpage.git/git-daemon-export-ok
            fi

            ${pkgs.git}/bin/git config --global daemon.receivepack true

            rm -f /srv/git/guezzlpage.git/hooks/post-receive
            ln -s "${deployScript}" /srv/git/guezzlpage.git/hooks/post-receive
            chown -R git:git /srv/git/guezzlpage.git
            "${deployScript}"
          '';
        };
      };
    };
  };
}
