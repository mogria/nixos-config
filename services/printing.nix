{ config, pkgs, ... }:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.browsing = false;
  services.printing.drivers = [ pkgs.gutenprint pkgs.gutenprintBin ];
  hardware.sane.enable = true;
}
