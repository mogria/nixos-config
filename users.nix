{ config, pkgs, ... }:

{

  users.enforceIdUniqueness = true;

  # Define a user account. Don't forget to set a password with passwd.
  users.extraUsers = {
    mogria = {
      isNormalUser = true;
      uid = 1000;
      extraGroups = [ "wheel" "mogria" "networkmanager"
        "lp" "dialout" # printing, and usb device access
        "scanner" # scanning
      ];
      shell = pkgs.zsh;
    };

    # loraine was uid 1001

    guest = {
      isNormalUser = true;
      uid = 1005;
      extraGroups = ["guest"];
    };
  };

  users.groups = [
    { gid = 1000; name = "mogria"; }
    { gid = 1005; name = "guest"; }
  ];

}
