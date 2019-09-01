{ config, pkgs, ... }:

let
  id = 999;
  user = "venus";
in {
  services.venus = {
    enable = true;
    name = "Void";
    ownerEmail = "m0gr14@gmail.com";
    ownerName = "Mogria";
    cacheDirectory = "/srv/storage/Feeds/Cache";
    outputDirectory = "/srv/storage/Feeds";
    inherit user;
    group = user;
    feeds = [ {
        feedUrl = "https://krebsonsecurity.com/feed/";
        homepageUrl = "https://krebsonsecurity.com/";
        name = "KrebsOnSecurity";
      } {
        feedUrl = "https://martinfowler.com/feed.atom";
        homepageUrl = "https://martinfowler.com";
        name = "Martin Fowler";
      } /* {
        feedUrl = "https://xn--gssl-0ra.ch/feed.xml";
        homepageUrl = "https://xn--gssl-0ra.ch";
        name = "Güssl";
      } */ {
        feedUrl = "http://antirez.com/rss";
        homepageUrl = "http://antirez.com/";
        name = "<antirez>";
      } {
        feedUrl = "https://xkcd.com/atom.xml";
        homepageUrl = "http://xkcd.com/";
        name = "XKCD";
      } {
        feedUrl = "http://rss.slashdot.org/Slashdot/slashdot";
        homepageUrl = "http://slashdot.org/";
        name = "Slashdot";
      } {
        feedUrl = "http://feeds.feedburner.com/CssTricks";
        homepageUrl = "http://css-tricks.com/";
        name = "CSS Tricks";
      } {
        feedUrl = "https://www.schneier.com/blog/atom.xml";
        homepageUrl = "https://www.schneier.com";
        name = "Schneier On Security";
      } {
        feedUrl = "http://waitbutwhy.com/feed";
        homepageUrl = "https://waitbutwhy.com";
        name = "Wait But Why";
      } {
        feedUrl = "https://news.ycombinator.com/rss";
        homepageUrl = "https://news.ycombinator.com";
        name = "Hacker News";
      } {
        feedUrl = "http://feeds.feedburner.com/codinghorror";
        homepageUrl = "http://blog.codinghorror.com/";
        name = "Coding Horror";
      }
    ];
  };

  users.extraUsers = {
    "${user}" = {
      uid = id;
    };
  };

  users.groups.venus = {
    gid = id;
  };
}
