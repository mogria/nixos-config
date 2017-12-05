{ config, pkgs, ... }:
{
  programs.adb.enable = true;
  users.extraUsers.mogria.extraGroups = ["adbusers"];
}
