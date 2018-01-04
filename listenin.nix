{ config, stdenv, pkgs, ...}:

let
  port = 80;
  file = pkgs.writeText "index.html" ''
        HTTP/1.1 200 OK
        Content-Type: text/html; charset=utf-8
        Server: Your moms Server

        <!doctype html>
        <html>
          <head><title>Hello :)</title>
          <body>
          <h1>Hi, you hit my computer</h1>
          <p>You can leave me a message if you netcat onto this port :)</p>
          </body>
       </html>


       '';
 
in {
  systemd.services."listenin" = {
    enable = true;
    after = [ "network.target" ];
    path = [ pkgs.netcat ];
    description = "listening in if somebody is doing stuff :)";

    script = ''
      while true; do
         < "${file}" nc -N -4 -l ${builtins.toString port}
      done
    '';
  };
  networking.firewall.allowedTCPPorts = [ port ];
}
