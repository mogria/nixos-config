{
  networkGroups = [ "networkmanager" ];
  printerGroups = [ "lp" "dialout" ]; # printing, and usb device access
  phoneGroups = [ "adbusers" ];
  serviceGroups = [ "transmission" ] ++ printerGroups;
  adminGroups = [ "wheel" "video" "docker" ];
  desktopGroups = networkGroups ++ serviceGroups ++ phoneGroups;
}
