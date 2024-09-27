{ home-manager, config, pkgs, ... }:

{
  programs.cava.enable = true;
  home.file.".config/cava".source = ./cava;
}
