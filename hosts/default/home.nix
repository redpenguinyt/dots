{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
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
    thunderbird

    vscode
    rustdesk
    gimp
    obs-studio

    osu-lazer
    steam
    modrinth-app
  ];

  programs.spicetify =
    let spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in {
      enable = true;
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "macchiato";
    };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
