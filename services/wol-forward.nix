{ config, stdenv, pkgs, ...}:

let
  port = 23000;
  wakeUpMacAddress = "e0:3f:49:7f:b0:ab";
  broadcastAddress = "192.168.1.255";
  listenAddress = "0.0.0.0"; # TODO: Change this to "192.168.23.0" once upstream is ready
  file = pkgs.writeText "index.html" (builtins.readFile ./wol-forward.html);
 
in {
  systemd.services."wol-forward" = {
    enable = true;
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.netcat pkgs.wol pkgs.dos2unix ];
    description = "listening for a connection to wake void up :)";

    script = ''#!/usr/bin/env bash

      while true; do
        unix2dos < '${file}' \
          | nc -N -4 -l ${listenAddress} ${builtins.toString port} \
          > /dev/null
        wol --host=${broadcastAddress} ${wakeUpMacAddress}
      done
    '';
  };
  networking.firewall.allowedTCPPorts = [ port ];
}
