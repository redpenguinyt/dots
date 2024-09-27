{ home-manager, config, pkgs, ... }:

{
#   wayland.windowManager.hyprland = {
#     enable = false;
#     settings = {};
#   };

  home.packages = with pkgs; [
    # hyprland
    hyprpaper hyprlock hypridle
    xdg-desktop-portal-hyprland
    polkit_gnome
    networkmanagerapplet
    xwaylandvideobridge
    catppuccin-cursors.macchiatoDark
    brightnessctl playerctl
    grim slurp hyprpicker jq
    wlogout
    dunst libnotify 
    waybar 
    wl-clipboard wl-clip-persist
    fuzzel 
    kitty
  ];

  home.file = {
    ".config/hypr".source = ./hypr;
    ".config/waybar".source = ./waybar;
    ".config/dunst/dunstrc".source = ./dunstrc;
    ".config/fuzzel/fuzzel.ini".source = ./fuzzel.ini;
    ".config/wlogout".source = ./wlogout;
  };

  gtk = {
    enable = true;

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    cursorTheme = {
      name = "Catppuccin-Macchiato-Dark";
      size = 32;
    };
    iconTheme.name = "Papirus-Dark";
  };
}
