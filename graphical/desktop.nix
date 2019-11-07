{ config, pkgs, lib, ... }:

{
  imports = [
      # ./framebuffer.nix
      # ./plymouth.nix
      ./fonts.nix
      ./packages.nix
      ../apps/glances-tty.nix
      ../apps/adb.nix
      ../services/printing.nix
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbModel = "pc104";
  services.xserver.xkbOptions = "terminate:ctrl_alt_bksp, eurosign:e";

  # Enable networking via network manager,
  # this enables GUI configuration of network connections/WLANs
  networking.networkmanager.enable = true;

  # Enable sound via pulseaudio
  hardware.pulseaudio.enable = true;

  # Open ports for KDE Connect
  networking.firewall.allowedTCPPorts = [
                        1714 1715 1716 1717 1718 1719
    1720 1721 1722 1723 1724 1725 1726 1727 1728 1729
    1730 1731 1732 1733 1734 1735 1736 1737 1738 1739
    1740 1741 1742 1743 1744 1745 1746 1747 1748 1749
    1750 1751 1752 1753 1754 1755 1756 1757 1758 1759
    1760 1761 1762 1763 1764
  ];
  networking.firewall.allowedUDPPorts = [
                        1714 1715 1716 1717 1718 1719
    1720 1721 1722 1723 1724 1725 1726 1727 1728 1729
    1730 1731 1732 1733 1734 1735 1736 1737 1738 1739
    1740 1741 1742 1743 1744 1745 1746 1747 1748 1749
    1750 1751 1752 1753 1754 1755 1756 1757 1758 1759
    1760 1761 1762 1763 1764
  ];

  services.dbus.packages = [
    # install printer configuration dialog when printing is enabled
    (lib.mkIf config.services.printing.enable pkgs.system-config-printer)
  ];


}
