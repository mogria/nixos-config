{ config, pkgs, fetchFromGithub, ... }:

let
  stdenv = pkgs.stdenv;
  fetchgit = pkgs.fetchgit;
  powerlevel9k = stdenv.mkDerivation rec {
    name = "zsh-powerlevel9k";
    version = "0.6.3";
    src = fetchgit {
      url = "https://github.com/bhilburn/powerlevel9k";
      rev = "refs/tags/v0.6.3";
      sha256 = "02c1yrr1cc5q51bzg83gyg9pqsx5im30hcvrqyh9mbpmibf6cr2p";
    };
    installPhase = ''
      mkdir -p $out/share/powerlevel9k
      cp -R functions $out/share/powerlevel9k
      cp powerlevel9k.zsh-theme $out/share/powerlevel9k
    '';
  };
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    # bind vi to vim because vim_configurable is used and doesn't provide vi
    shellAliases = { vi = "vim"; };
    promptInit = "";
    interactiveShellInit = ''
      export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
      plugins=(git dircycle composer)

      POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(command_execution_time status root_indicator)
      POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(dir vcs)
      POWERLEVEL9K_STATUS_VERBOSE=true
      # ugly hack: oh my zsh only wants a relative path, so lets go bback to the system root
      export ZSH_THEME="../../../../../../../../../../../${powerlevel9k}/share/powerlevel9k/powerlevel9k"
      source $ZSH/oh-my-zsh.sh
    '';
  };
}
