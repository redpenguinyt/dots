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

  home.sessionPath = [ "$HOME/.cargo/bin" ];

  home.packages = with pkgs; [
    firefox
    obsidian
    blender
    rustdesk
    gimp

    vscode
    gcc rustup python3

    vesktop
    thunderbird
    synology-drive-client

    baobab
    vlc

    obs-studio
    osu-lazer-bin
    steam
    lunar-client
  ];

  programs.spicetify =
    let spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in {
      enable = true;
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "macchiato";
    };
}
