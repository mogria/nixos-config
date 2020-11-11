{ stdenv, fetchFromGitHub, python3 }:
# Python 3 support requires https://github.com/larsenwork/monoid/pull/233 to be merged

stdenv.mkDerivation {
  pname = "monoid";
  version = "2020-25-19";

  src = fetchFromGitHub {
    owner = "jtojnar";
    repo = "monoid";
    rev = "f84f2ed61301ee84dadd16351314394f22ebed2f";
    sha256 = "0p41kqp1zhsxk10v2vhgaphg6v9v10j0v6rnpjh37gfrj98rqwpl";
  };

  nativeBuildInputs = [
    (python3.withPackages (pp: with pp; [
      fontforge
    ]))
  ];

  buildPhase = ''
    local _d=""
    local _l=""
    for _d in {Monoisome,Source}/*.sfdir; do
      _l="''${_d##*/}.log"
      echo "Building $_d (log at $_l)"
      python Scripts/build.py 1 0 $_d > $_l
    done
  '';

  installPhase = ''
    install -m444 -Dt $out/share/fonts/truetype _release/*
    install -m444 -Dt $out/share/doc            Readme.md
  '';

  meta = with stdenv.lib; {
    homepage = "http://larsenwork.com/monoid";
    description = "Customisable coding font with alternates, ligatures and contextual positioning";
    license = [ licenses.ofl licenses.mit ];
    platforms = platforms.all;
    maintainers = [ maintainers.mogria ];
  };
}
