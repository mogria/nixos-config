{ pkgs, config, ... }:

{
	services.radicale = {
	    enable = true;
	    config =
		''
		[server]
		# Bind all interfaces on port 5232 
		hosts = 0.0.0.0:5232
		'';
	};
}
