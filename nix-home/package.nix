{ stdenv, python, fetchFromGitHub }:
stdenv.mkDerivation rec {
  version = "0.3.2";
  name = "nix-home-${version}";

  src = fetchFromGitHub {
    rev = version;
    repo = "nix-home";
    owner = "sheenobu";
    sha256 = "0l27vg651s9mmq0sypxgrrdq9386rhjbgh9wilzm3dmr0d2j9mwa";
  };

  patchPhase = ''
    substituteInPlace nix-home --replace "NIXHOME" "$out/nix/lib"
    substituteInPlace nix-build-home --replace "NIXHOME" "$out/nix/lib"
  '';

  installPhase = ''
    # install binary
    mkdir -p $out/bin
    cp nix-home $out/bin
    cp nix-build-home $out/bin
    chmod +x $out/bin/nix-build-home
    chmod +x $out/bin/nix-home

    # install nix-home lib
    mkdir -p $out/nix
    cp -a lib $out/nix
  '';

  meta = {
    homepage = https://github.com/sheenobu/nix-home;
    description = "Per-user configuration management via Nix";
    licenses = [ stdenv.lib.license.mit ];
    platforms = stdenv.lib.platforms.unix;
    inherit version;
  };
}
