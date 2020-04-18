{ config, pkgs, lib, ... }:

{
  imports = [
    ./opengl.nix
  ];

  boot.extraModulePackages = [ config.boot.kernelPackages.nvidiabl ];
  # These are probably only required if we modeset ind the kernel cmdlineon boot already:
  #   https://wiki.archlinux.org/index.php/NVIDIA#DRM_kernel_mode_setting 
  # boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" "kvm-intel"];

  # Export configuration for easier debugging
  services.xserver.exportConfiguration = true;

  # mkForce is necessary else we still have "nouveau" in this list
  # which is known to clash with nvidia.  The "nvidia" driver
  # doesn't work any other Driver in this list, not even
  # "modesetting", or "intel".
  services.xserver.videoDrivers = lib.mkForce [ "nvidia" ];


  hardware.nvidia = {
    modesetting.enable = true;
    optimus_prime = {
      enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      # allowExternalGpu = true;
    };
  };

  # might be better: hardware.acpilight.enable = true;
  # funkioniert mit xbacklight anstatt mit root und `light -S 90`
  programs.light.enable = true;

  services.xserver.displayManager.setupCommands = ''
    # Fix for optimus without bumblebee
    xrandr --setprovideroutputsource modesetting NVIDIA-0
    xrandr --auto 
  '';


  # mit bumblebee kanen nurAapplikatione
  # die den GPU f√r sich beanspruchen brauchen gestart werden.
  # Dies w√re sehr n√tzlich um strom zu
  # sparen beim akkubetrieb im gegensatz zu
  # optimus wo die NVIDIA Karte die ganze Zeit luft
  hardware.bumblebee = {
    enable = false;
    driver = "nvidia";
    connectDisplay = true;
    group = "video";
  };

}
