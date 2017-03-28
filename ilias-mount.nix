{ config, lib, pkgs, ... }:

{
  fileSystems = [{
    mountPoint = "/home/ilias";
    label = "ilias";
    device = "https://elearning.hslu.ch/ilias/webdav.php/hslu/ref_3260789/";
    fsType = "davfs";
    options = ["user" "noauto" "uid=mogria" "file_mode=600" "dir_mode=700" ];
  }];

  users.extraUsers = [
    {
      name = "davfs2";
      createHome = false;
      group = "davfs2";
    }
  ];
  users.groups = { davfs2 = {}; };

  security.setuidPrograms = [ "mount" "umount" ];
}
