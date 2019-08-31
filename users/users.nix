{ config, pkgs, ... }:

let 
  networkGroups = [ "networkmanager" ];
  printerGroups = [ "lp" "dialout" ]; # printing, and usb device access
in {
  users.enforceIdUniqueness = true;

  # Define a user account. Don't forget to set a password with passwd.
  users.extraUsers = {
    mogria = {
      isNormalUser = true;
      uid = 1000;
      extraGroups = [ "wheel" "mogria"
        "docker"
        "video"
      ] ++ networkGroups ++ printerGroups;
      shell = pkgs.zsh;
    };

    # loraine was uid 1001

    marci = {
      isNormalUser = true;
      uid = 1006;
      extraGroups = [
        "wheel"
      ] ++ networkGroups ++ printerGroups;
    };

    zahir = {
      isNormalUser = true;
      uid = 1007;
      extraGroups = [
      ] ++ networkGroups ++ printerGroups;
    };

    guest = {
      isNormalUser = true;
      uid = 1005;
      extraGroups = ["guest"];
    };
  };

  users.groups = [
    { gid = 1000; name = "mogria"; }
    { gid = 1005; name = "guest"; }
    { gid = 1006; name = "marci"; }
  ];

}
