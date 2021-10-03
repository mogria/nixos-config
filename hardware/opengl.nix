{ config, pkgs, ...}:

{
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [ vaapiIntel libvdpau-va-gl vaapiVdpau intel-ocl ];

    # Enable 32bit stuff for games in steam
    driSupport32Bit = true;
    extraPackages32 = with pkgs.driversi686Linux; [ glxinfo vaapiIntel libvdpau-va-gl vaapiVdpau ];
  };
}
