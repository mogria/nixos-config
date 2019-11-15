self: super: {
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
      ${super.pkgs.gzip}/bin/gzip -n $out/share/consolefonts/*
    '';
  };
}

