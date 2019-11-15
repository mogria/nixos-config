self: super:

let
  baseLinuxPackages = super.linuxPackages;
in {
  linuxPackages = baseLinuxPackages.extend (self: super: {
    rtl8821au = baseLinuxPackages.rtl8821au.overrideAttrs (attrs: {
      meta = with self.stdenv.lib; {
        platforms = [ "aarch64-linux" "x86_64-linux" ];
      };
    });
  });
}
