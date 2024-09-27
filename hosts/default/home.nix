{ config, pkgs, ... }:

{
  imports = [
    ../../modules/desktop
    ../../modules/kitty
    ../../modules/shell
  ];

  home.username = "ren";
  home.homeDirectory = "/home/ren";

  home.stateVersion = "24.05"; # Please read the comment before changing.
  nixpkgs.config.allowUnfreePredicate = _: true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    firefox
    obsidian
    synology-drive-client

    vesktop
    spotify
    thunderbird

    vscode
    rustdesk
    gimp
    obs-studio

    osu-lazer
    steam
    modrinth-app

    (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ren/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
