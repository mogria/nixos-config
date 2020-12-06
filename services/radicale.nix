{ pkgs, config, ... }:

let
  port = 5232;
in {
    networking.firewall.allowedTCPPorts = [ port ];
	services.radicale = {
	    enable = true;
	    config =
		''
		[server]
		# Bind all interfaces on port ${builtins.toString port}
		hosts = 0.0.0.0:${builtins.toString port}
		'';
	};
}
