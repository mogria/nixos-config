{ config, pkgs, ...}:

{
    virtualisation.virtualbox.host.enable = true;
    users.extraUsers.mogria.extraGroups = [ "vboxusers" ]; # in order to use USB devices from the host
}
