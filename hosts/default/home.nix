{ pkgs, inputs, ... }: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
    ../../modules/desktop
    ../../modules/kitty
    ../../modules/shell
    ../../modules/neovim
  ];

  home.username = "ren";
  home.homeDirectory = "/home/ren";

  home.stateVersion = "24.05"; # Don't change under any circumstance
  nixpkgs.config.allowUnfreePredicate = _: true;
  programs.home-manager.enable = true; # Let Home Manager install and manage itself.

  home.packages = with pkgs; [
    firefox
    obsidian
    blender
    vscode
    rustdesk
    gimp

    vesktop
    thunderbird
    synology-drive-client

    baobab

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
}
