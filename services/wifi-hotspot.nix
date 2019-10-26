{ config, pkgs, lib, ... }:

{
  services.hostapd = {
    enable = true;
    channel = 13;
    interface = "wlan0";
    # group = "wheel"; # e.g. "network"
    # hwMode = "g"; # one of [ "a" "b" "g" ]
    wpa = true;
    ssid = "<nonet>";
    wpaPassphrase = builtins.readFile /.wpa-passphrase;
  };
}
