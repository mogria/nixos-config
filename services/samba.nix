{ config, pkgs, lib, ... }:

{
  services.samba = {
    enable = true;
    package = pkgs.samba;
    enableNmbd = true;
    enableWinbindd  = true;
    securityType = "user";
    # syncPasswordsByPam = true; # Enabling this will add a line directly after pam_unix.so.
                               # Whenever a password is changed the samba password will be updated as well.
                               # However, you still have to add the samba password once, using smbpasswd -a user

    extraConfig = ''
	  workgroup = WORKGROUP
	  server string = void
	  netbios name = void
	  #use sendfile = yes
	  #max protocol = smb2
	  hosts allow = 192.168.0.0/16 127.0.0.1 localhost
	  hosts deny = 0.0.0.0/0
      security = user
	  guest account = nobody
	  map to guest = bad user
    '';

    shares = {
      datadump = {
        path = "/srv/storage";
        browseable = "yes";
        "read only" = "no";
        "writeable" = "yes";
        "write list" = "mogria marci zahir shareuser";
        "guest ok" = "no";
		"create mask" = "0664";
		"directory mask" = "0775";
		"force user" = "shareuser";
		"force group" = "users";
        comment = "DeDateguezzl";
      };
    };
  };

  users.extraUsers = {
    shareuser = {
      uid = 998;
      extraGroups = [ "users" "transmission" "venus" ];
    };
  };

  users.groups = [
    { gid = 998; name = "shareuser"; }
  ];

  networking.firewall.allowPing = true;
  networking.firewall.allowedTCPPorts = [ 139 445 ];
  networking.firewall.allowedUDPPorts = [ 137 138 ];

}
