self: super: {
  tamzen-console-font =  let version = "1.11.4"; in super.pkgs.fetchFromGitHub {
    name = "tamzen-console-font-${version}";

    owner = "sunaku";
    repo = "tamzen-font";
    rev = "refs/tags/Tamzen-${version}";
    sha256 = "0rpfdz7r0ps75nvw8kqz0nnkdgfgbhz1pvfnm5lra9yfz0h42g6v";

    downloadToTemp = true;
    recursiveHash = true;
    postFetch = ''
      tar -xzvf $downloadedFile --strip-components=1
      mkdir -p $out/share/consolefonts
      cp -R psf/*.psf $out/share/consolefonts
      ${super.pkgs.gzip}/bin/gzip $out/share/consolefonts/*
    '';
  };
}

