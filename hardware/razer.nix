{ config, pkgs, ... }:

{
  # Requires the user to be in plugdev group
  # for this systemd user service to start
  hardware.openrazer= {
    enable = true;
    keyStatistics = true;
    syncEffectsEnabled = true;
    # verboseLogging = true;
  };
}
