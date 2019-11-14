{ config, pkgs, ... }:

let 
  networkGroups = [ "networkmanager" ];
  printerGroups = [ "lp" "dialout" ]; # printing, and usb device access
  phoneGroups = [ "adbusers" ];
  desktopGroups = networkGroups ++ printerGroups ++ phoneGroups;
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
      ] ++ desktopGroups;
    };

    # loraine was uid 1001

    marci = {
      isNormalUser = true;
      uid = 1006;
      extraGroups = [
        "wheel"
        "transmission"
      ] ++ desktopGroups;
      openssh.authorizedKeys.keyFiles = [
        ./keys/marci_acab_ecdsa.pub
      ];
    };

    zahir = {
      isNormalUser = true;
      uid = 1007;
      extraGroups = [
        "transmission"
      ] ++ desktopGroups;
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
