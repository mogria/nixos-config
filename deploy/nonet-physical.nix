{
  void = { pkgs, ... }: {
    deployment.targetHost = "127.0.0.1";
  };

  noroute = { pkgs, ... }: {
    deployment.targetHost = "192.168.1.3";
  };
}
