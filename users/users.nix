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
        "transmission"
      ] ++ networkGroups ++ printerGroups;
      shell = pkgs.zsh;
      openssh.authorizedKeys.keyFiles = [ ./keys/mogria_voidbook_ecdsa.pub ];
    };

    # loraine was uid 1001

    marci = {
      isNormalUser = true;
      uid = 1006;
      extraGroups = [
        "wheel"
        "transmission"
      ] ++ networkGroups ++ printerGroups;
    };

    zahir = {
      isNormalUser = true;
      uid = 1007;
      extraGroups = [
        "transmission"
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
