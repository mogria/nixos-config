{
  services.openldap = {
    enable = true;
    dataDir = "/var/lib/openldap";
    urlList = [ "ldap:///" "ldapi:///" ]; # Add ldaps to this list to listen with SSL (requires configured certificates)
    suffix = "dc=noroute,dc=net";
    rootdn = "cn=admin,dc=noroute,dc=net";
    rootpwFile = "/.ldap-root-pw";
    # See https://www.openldap.org/doc/admin24/slapdconfig.html

    extraDatabaseConfig = ''
      access to dn.base="dc=noroute,dc=net" by * read
      # Add your own ACLs here…
      # Drop everything that wasn't handled by previous ACLs:
      access to * by * none

      index objectClass eq
      index uid eq
      index mail sub
      # Accelerates replication if you use it
      index entryCSN eq
      index entryUUID eq

      readonly on
    '';
    # This will drop the whole database contents of OpenLDAP and run
    # this LDIFF script on each startup of the server, so that only nix can generate entries.
    # It's not allowed to write entries to the database as long as 'readonly on' is configured above.
    declarativeContents = "
    ";
  };
}
