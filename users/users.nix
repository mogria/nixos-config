{ config, pkgs, ... }:

let 
  networkGroups = [ "networkmanager" ];
  printerGroups = [ "lp" "dialout" ]; # printing, and usb device access
in {

  imports = [
    ./minimal.nix
  ];

  # Define a user account. Don't forget to set a password with passwd.
  users.extraUsers = {
    # most of user 'mogria' is defined in ./minimal.nix
    mogria = {
      extraGroups = [
        "docker"
        "video"
        "transmission"
      ] ++ networkGroups ++ printerGroups;
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
    { gid = 1005; name = "guest"; }
    { gid = 1006; name = "marci"; }
  ];

}
