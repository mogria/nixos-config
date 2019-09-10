{ config, stdenv, pkgs, ...}:

let
  port = 23000;
  wakeUpMacAddress = "e0:3f:49:7f:b0:ab";
  broadcastAddress = "192.168.23.255";
  file = pkgs.writeText "index.html" ''
        HTTP/1.1 200 OK
        Content-Type: text/html
        Server: noroute

        <!doctype html>
        <html>
          <head><title>noroute</title></head>
          <body>
          <h1>Hi, you hit noroute</h1>
          <p><code>void</code> will be available in a minute.</p>
          <ul>
             <li><a href="http://192.168.23.2:4040">Music</a></li>
             <li><a href="smb://192.168.23.2/datadump">Files</a></li>
             <li><a href="http://192.168.23.2:9091">Downloads</a></li>
          </ul>
          </body>
       </html>

       '';
 
in {
  systemd.services."wol-forward" = {
    enable = true;
    after = [ "network.target" ];
    path = [ pkgs.netcat pkgs.wol pkgs.dos2unix ];
    description = "listening for a connection to wake void up :)";

    script = ''#!/usr/bin/env bash

      while true; do
        unix2dos < '${file}' \
          | nc -N -4 -l ${builtins.toString port} \
          > /dev/null
        wol --host=${broadcastAddress} ${wakeUpMacAddress}
      done
    '';
  };
  networking.firewall.allowedTCPPorts = [ port ];
}
