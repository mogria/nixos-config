{ config, pkgs, lib, ... }:

{
  imports = [
    ./opengl.nix
  ];

  # make the backlight work
  boot.extraModulePackages = [ config.boot.kernelPackages.nvidiabl ];

  # These are probably only required if we pass
  # 'nvidia-drm.modeset=1' and modeset in the kernel cmdline on
  # boot already:
  #   https://wiki.archlinux.org/index.php/NVIDIA#DRM_kernel_mode_setting 
  boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia-uvm" "nvidia_drm" "kvm-intel"];

  # Export configuration for easier debugging
  services.xserver.exportConfiguration = true;

  # Note, when nvidia is used as the driver no other driver can be used
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.blacklistedKernelModules = [ "nouveau" ];
  hardware.nvidia = {
    # modesetting should resolve tearing, but it doesn't seem to do
    # anything.
    modesetting.enable = true;
    powerManagement.enable = true;
    prime = {
      # sync.enable = true;
      # only either offload or sync, powermanagement requires offload
      offload.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      # allowExternalGpu = true;
    };
  };

  hardware.acpilight.enable = true;

  # might be better: hardware.acpilight.enable = true;
  # funkioniert mit xbacklight anstatt mit root und `light -S 90`
  programs.light.enable = true;

  services.xserver.displayManager.setupCommands = ''
    # Fix for optimus without bumblebee
    ${pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource modesetting NVIDIA-0
    ${pkgs.xorg.xrandr}/bin/xrandr --auto
  '';


  # mit bumblebee kanen nur Applikationen
  # die den GPU f√√r sich beanspruchen brauchen gestart werden.
  # Dies w√re sehr n√tzlich um strom zu
  # sparen beim akkubetrieb im gegensatz zu
  # optimus wo die NVIDIA Karte die ganze Zeit luft
  hardware.bumblebee = {
    enable = false; # ! deactivated
    driver = "nvidia";
    connectDisplay = true;
    group = "video";
  };

}
