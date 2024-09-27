{ inputs, config, pkgs, ... }:

{
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  environment.systemPackages = [ pkgs.imv ];

  programs.xfconf.enable = true;

  services.tumbler.enable = true;
  services.gvfs.enable = true;

  home-manager.users."ren".home.file = {
    ".config/Thunar".source = ./Thunar;
    ".config/xfce4/helpers.rc".source = ./helpers.rc;
  };
}
