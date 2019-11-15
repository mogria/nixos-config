{ pkgs, ... }:

let
  urls = pkgs.writeText "newsboat-urls" ''
    https://krebsonsecurity.com/feed/ security
    https://martinfowler.com/feed.atom software
    https://xn--gssl-0ra.ch/feed.xml music
    http://antirez.com/rss software "~antirez blog"
    https://xkcd.com/atom.xml comics
    http://rss.slashdot.org/Slashdot/slashdot technews
    http://feeds.feedburner.com/CssTricks software
    https://www.schneier.com/blog/atom.xml security
    http://waitbutwhy.com/feed
    https://news.ycombinator.com/rss technews
    http://feeds.feedburner.com/codinghorror software
  '';

  config = pkgs.writeText "newsboat-config" ''
    auto-reload yes
    reload-time 30
    cookie-cache ~/newsboat/cookies.txt

    download-full-page yes
    download-retries 3
    error-log /var/log/newsboat-error.log

    # don't delete old feed entries
    max-items 0

    user-agent "newsboat"

    html-renderer "w3m -dump -T text/html"

    bindkey S save-all
  '';
  ttyNumber = 11;
in {
  users.users.newsboat = {
    uid = 990;
    description = "NewsBoat RSS Daemon User";
    extraGroups = [ "newsboat" ];
    packages = [ pkgs.newsboat pkgs.sqlite ];
    createHome = true;
    home = "/var/lib/newsboat";
  };

  users.groups = [ { gid = 990; name = "newsboat"; } ];

  boot.extraTTYs = ["tty${toString ttyNumber}"];

  systemd.services."newsboat" = {
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    description = "Newsboat RSS Daemon";

    path = [ "${pkgs.newsboat}/bin" "${pkgs.coreutils}/bin" ];

    preStart = ''
      set -e
      set -x
      ${pkgs.newsboat}/bin/newsboat -u ${urls} --export-to-opml > /var/lib/newsboat/export.opml
      ${pkgs.newsboat}/bin/newsboat --import-from-opml=/var/lib/newsboat/export.opm
    '';

    serviceConfig = {
      ExecStart = "${pkgs.newsboat}/bin/newsboat -u ${urls} --config-file=${config} --refresh-on-start";
      User = "newsboat";
      Group = "newsboat";
      Environment=''
        XDG_CONFIG_HOME=/var/lib/newsboat
        XDG_DATA_HOME=/var/lib/newsboat
      '';

      StandardInput = "tty";
      StandardOutput = "tty";
      TTYPath = "/dev/tty${toString ttyNumber}";
      TTYReset = true;
      TTYVTDisallocate = true;
      Restart = "always";
    };

    # so newsboat fetches the urls as soon as we update them in here
    restartIfChanged = true;
  };

  services.mingetty.helpLine = "Press <Alt-F${toString ttyNumber}> to read some news from RSS feeds.";

}
