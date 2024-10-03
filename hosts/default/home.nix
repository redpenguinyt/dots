{ pkgs, inputs, ... }:

{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
    ../../modules/desktop
    ../../modules/kitty
    ../../modules/shell
    ../../modules/neovim
  ];

  home.username = "ren";
  home.homeDirectory = "/home/ren";

  home.stateVersion = "24.05"; # Please read the comment before changing.
  nixpkgs.config.allowUnfreePredicate = _: true;

  # Home packages
  home.packages = with pkgs; [
    firefox
    obsidian
    synology-drive-client

    vesktop
    thunderbird

    blender
    vscode
    rustdesk
    gimp
    obs-studio

    osu-lazer-bin
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
