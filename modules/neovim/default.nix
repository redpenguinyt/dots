{ pkgs, ... }:

{
  programs.neovim =
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      # luajitPackages.lua-lsp
      nil
    ];

    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./plugins/lsp.lua;
      }

      {
      	plugin = tokyonight-nvim; # Tokyo Night Theme
	      config = toLua ''
          require('tokyonight').setup({ transparent = true })
	        vim.cmd[[colorscheme tokyonight]]
	      '';
      }

      {
        plugin = comment-nvim;
        config = toLua "require('Comment').setup()";
      }

      {
        plugin = lightline-vim;
        config = toLua ''vim.g.lightline = {
          colorscheme = 'wombat',
          active = {
            left = { { 'mode', 'paste' }, { 'readonly', 'filename', 'modified' } },
            right = { { 'lineinfo' }, { 'percent' }, { 'filetype' } },
          },
          component_function = { gitbranch = 'FugitiveHead' },
        }'';
      }

      {
        plugin = nvim-autopairs;
        config = toLua "require('nvim-autopairs').setup {}";
      }
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
    '';
  };
}
