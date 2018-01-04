self: super:

let
  baseLinuxPackages = super.linuxPackages;
  nvidiaDriver = args: baseLinuxPackages.callPackage (import <nixpkgs/pkgs/os-specific/linux/nvidia-x11/generic.nix> args) { }; 
in {
  linuxPackages = baseLinuxPackages.extend (self: super: {
    nvidiaPackages.stable = nvidiaDriver {
        # version = "384.90";
        # sha256_32bit = "1v4i4d9y9qmsgssfcfsm1gmf5psp2c5cs8dm08yg8kc79y56a5qc";
        # sha256_64bit = "1ggylpzw1j217w64rspw4fhvq25wz0la0hhy0b1kxjpwy8h6ipqd";
        # settingsSha256 = "023jfbsxsbkjk78i9i6wd0sybv5hib2d7mfvy635w3anjcrsk5il";
        # persistencedSha256 = "166ya8pnv4frvrsp0x5zkg8li85vipags03wy6dlf8s940al92z2";

        version = "387.34";
        sha256_32bit = "0v4i4d9y9qmsgssfcfsm1gmf5psp2c5cs8dm08yg8kc79y56a5qc";
        sha256_64bit = "06w8dw6hb40ymz6ax7v82j29ihmp3d7yxsi8ah9ch10jldl973z4";
        settingsSha256 = null; # "0dpm22ggpr93ypz24ap9vgx43ik7lw6cxcb29v8ys2iinhs7zm7s";
        persistencedSha256 = null; # "02lf9b6j85amc1vr84lj98q74a680nrx4fmpxj17cz597yq8s200";
      };
  });
}
