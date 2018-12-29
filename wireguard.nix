{ config, pkgs, ... }:

{
  # Enable Wireguard
  networking.wireguard.interfaces = {
    # "wg0" is the network interface name. You can name the interface arbitrarily.
    wg0 = {
      # Determines the IP address and subnet of the client's end of the tunnel interface.
      ips = [ "10.100.0.2/24" ];

      # Path to the private key file.
      #
      # Note: The private key can also be included inline via the privateKey option,
      # but this makes the private key world-readable; thus, using privateKeyFile is
      # recommended.
      privateKeyFile = "/root/wireguard-keys/private";

      peers = [
        # For a client configuration, one peer entry for the server will suffice.
        {
          # Public key of the server (not a file path).
          publicKey = "wJBhjq5lwGqp0fx54SfP9w/J7sdFGbr8MVTntKGo9mw=";

          # List of IPs assigned to this peer within the tunnel subnet. Used to configure routing.
          # For a server peer this should be the whole subnet.
          allowedIPs = [ "10.100.0.0/24" ];

          # Set this to the server IP and port.
          endpoint = "62.146.13.29:51820";

          # Send keepalives every 25 seconds. Important to keep NAT tables alive.
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
