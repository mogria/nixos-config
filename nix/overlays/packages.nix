self: super:

let
  baseLinuxPackages = super.linuxPackages;
  pkgs = self.pkgs;
in {

  # Inspired by https://stackoverflow.com/questions/29075927/how-to-modify-a-nixos-package-configuration
  linuxPackages = baseLinuxPackages.extend (self: super: {
    nvidiabl = super.nvidiabl.overrideAttrs (attrs: {
      # $ git diff nvidiabl-gpu.h | sed 's/overlays\///g' > nvidiabl-gpu.patch
      patches = (if attrs ? patches then attrs.patches else [] )  ++ [ ./nvidiabl-gpu.patch ];
    });

    rtl8821au = super.rtl8821au.overrideAttrs (attrs: {
      name = "rtl8821au-overridden";
      src = pkgs.fetchFromGitHub {
        owner = "abperiasamy";
        repo = "rtl8812AU_8821AU_linux";
        rev = "fa68771376a637c0b5f9cfa53da008570939a259";
        sha256 = "0vm1zdssd6crfq7v1i0wjlbmr6fax1lg6d09jl2g85d2hyjw942f";
      };
      meta = {
        platforms = [ "aarch64-linux" "x86_64-linux" ];
      };
    });
  });

  tamzen-console-font =  let version = "1.11.4"; in super.pkgs.fetchFromGitHub {
    name = "tamzen-console-font-${version}";

    owner = "sunaku";
    repo = "tamzen-font";
    rev = "refs/tags/Tamzen-${version}";
    sha256 = "0rq5w918lbghqdbqdb03n65slzdb64lrwap0xs0q4cwpql3jc19w";

    downloadToTemp = true;
    recursiveHash = true;
    postFetch = ''
      tar -xzvf $downloadedFile --strip-components=1
      mkdir -p $out/share/consolefonts
      cp -R psf/*.psf $out/share/consolefonts
      ${pkgs.gzip}/bin/gzip -n $out/share/consolefonts/*
    '';
  };

  sudo = super.sudo.override { withInsults = true; };
}

