{ home-manager, config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

	plugins = [
	  pkgs.vimPlugins.lightline-vim
	];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
    '';
  };
}
