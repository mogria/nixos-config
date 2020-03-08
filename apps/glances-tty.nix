{ config, pkgs, ... }:

let
  glancesPackage = pkgs.glances;
  ttyNumber = 12;
  user = "glances";
  runScript = pkgs.writeScriptBin "glances-tty-wrapper"
    ''
      #! ${pkgs.stdenv.shell} -e
      exec ${glancesPackage}/bin/glances --debug
    '';
in
{
  environment.systemPackages = [ glancesPackage runScript ];

  console.extraTTYs = ["tty${toString ttyNumber}"];

  systemd.services."glances-tty" = {
    description = "Glances TTY${toString ttyNumber}";
    wantedBy = [ "multi-user.target" ];
    serviceConfig =
      { ExecStart = "${runScript}/bin/glances-tty-wrapper";
        StandardInput = "tty";
        StandardOutput = "tty";
        TTYPath = "/dev/tty${toString ttyNumber}";
        TTYReset = true;
        TTYVTDisallocate = true;
        Restart = "always";
      };
  };

  services.mingetty.helpLine = "Press <Alt-F${toString ttyNumber}> to take a glance on whats going on on the system.";

}
