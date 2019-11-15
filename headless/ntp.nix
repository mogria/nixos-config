{ pkgs, options, ... }:

let
  timeservers = options.networking.timeServers.default ++ [ "time.nist.gov" ];
in {
  services.ntp = {
    enable = true;
    servers = timeservers;
  };

  networking.timeServers = timeservers;
}
