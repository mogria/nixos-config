{ pkgs, config, ... }:

{
  security.tpm2 = {
    enable = true;
    # abrmd.enable = true;
    # pkcs11.enable = true;
  };
}
