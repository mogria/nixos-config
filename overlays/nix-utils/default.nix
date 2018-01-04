self: super: {
  nix-utils = super.stdenv.mkDerivation {
    name = "nix-utils";
    version = "0.1";
    buildPhase = "";
    installPhase = ''
      cp -R . "$out"
    '';
    src = ./.;
  };
}
