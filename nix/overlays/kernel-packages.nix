{ pkgs, ... }:


  nixpkgs.config.packageOverrides = pkgs: {
    linuxPackages = pkgs.linuxPackages // {
      nvidiabl = pkgs.linuxPackages.nvidiabl.overrideDerivation (attrs: {
        # $ git diff nvidiabl-gpu.h | sed 's/overlays\///g' > nvidiabl-gpu.patch
        patches = (if attrs ? patches then attrs.patches else [] )  ++ [ ./nvidiabl-gpu.patch ];
      });

      # rtl8821au = super.linuxPackages.rtl8821au.overrideDerivation (attrs: {
        # name = "rtl8821au-${attrs.version}";
        # meta = with self.stdenv.lib; {
          # platforms = [ "aarch64-linux" "x86_64-linux" ];
        # };
      # });
    };
  };

}
