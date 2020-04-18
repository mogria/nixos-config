{ config, pkgs, ...}:

{
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [ vaapiIntel libvdpau-va-gl vaapiVdpau intel-ocl ];

    # Disable 32bit stuff, as I don't plan to run games/wine/old graphics stuff...
    # driSupport32Bit = true;
    # extraPackages32 = with pkgs.driversi686Linux; [ glxinfo vaapiIntel libvdpau-va-gl vaapiVdpau ];
  };
}
