{ config, stdenv, pkgs, ...}:

let
  port = 23000;
  file = pkgs.writeText "index.html" ''
        HTTP/1.0 200 OK
        Content-Type: text/html; charset=utf-8
        Server: noroute

        <!doctype html>
        <html>
          <head><title>noroute</title>
          <body>
          <h1>Hi, you hit noroute</h1>
          <p><pre>void</pre> will be available in a few seconds.</p>
          <ul>
             <li><a href="http://192.168.23.2:4040">Music</a>
             <li><a href="smb://192.168.23.2/datadump">Files</a>
             <li><a href="http://192.168.23.2:9091">Downloads</a>
          </ul>
          </body>
       </html>
       '';
 
in {
  systemd.services."wol-forward" = {
    enable = true;
    after = [ "network.target" ];
    path = [ pkgs.netcat pkgs.wol ];
    description = "listening for a connection to wake void up :)";

    script = ''
      while true; do
         < "${file}" nc -N -4 -l ${builtins.toString port}
         wol --host=192.168.23.255 e0:3f:49:7f:b0:ab
      done
    '';
  };
  networking.firewall.allowedTCPPorts = [ port ];
}
