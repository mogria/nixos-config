rec {
  networkGroups = [ "networkmanager" ];
  printerGroups = [ "lp" "dialout" "scanner" ]; # printing, and usb device access
  phoneGroups = [ "adbusers" ];
  serviceGroups = [ "transmission" ] ++ printerGroups;
  adminGroups = [ "wheel" "video" "docker" /* for openrazor: */ "plugdev" ];
  desktopGroups = networkGroups ++ serviceGroups ++ phoneGroups;
}
