self: super:

let
  baseLinuxPackages = super.linuxPackages;
in {
  linuxPackages = baseLinuxPackages.extend (self: super: {
    nvidiabl = baseLinuxPackages.nvidiabl.overrideAttrs (attrs: {
      # $ git diff nvidiabl-gpu.h | sed 's/overlays\///g' > nvidiabl-gpu.patch
      patches = (if attrs ? patches then attrs.patches else [] )  ++ [ ./nvidiabl-gpu.patch ];
    });
  });
}
