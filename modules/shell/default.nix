{ ... }: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    enableCompletion = true;
    autosuggestion.enable = false;
    syntaxHighlighting.enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --fast --flake";
      fetch   = "clear && fastfetch";
      search-history = "cat ~/.cache/zsh_history | grep";
      nixdiff = "nvd diff $(\\ls -d1v /nix/var/nix/profiles/system-*-link|tail -n 2)";

      v     = "nvim";
      cat   = "bat";
      grep  = "rg";
      ls    = "eza -h";
      clear = "echo -n '\\e[H\\e[3J'";
      cls   = "clear";
    };

    initExtra = ''
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      bindkey '^[[Z' reverse-menu-complete

      autoload -U colors && colors
      PS1="[%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~%{$reset_color%}]# "

      fastfetch --config ${./fastfetch/startup.jsonc}
    '';

    history = {
      ignoreDups = true;
      size = 10000;
      path = "$HOME/.cache/zsh_history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "thefuck"];
      theme = "robbyrussell";
    };
  };

  programs.fzf.enable = true;
  programs.bat.enable = true;
  programs.ripgrep.enable = true;
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = true;
  };
  programs.thefuck.enable = true;

  programs.git = {
    enable = true;
    userName  = "Red Penguin";
    userEmail = "redpenguin777@yahoo.com";
    extraConfig = {
      init.defaultBranch = "master";
      advice.addIgnoredFile = false;
    };
  };

  programs.fastfetch.enable = true;
  home.file.".config/fastfetch".source = ./fastfetch;

  programs.btop = {
    enable = true;
    extraConfig = ''
      theme_background = False
    '';
  };

  programs.cava.enable = true;
  home.file.".config/cava".source = ./cava;
}
