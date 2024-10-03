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
        plugin = lightline-vim;
        config = toLuaFile ./plugins/lightline.lua;
      }

      { # Theme
      	plugin = tokyonight-nvim;
	      config = toLua ''
            require('tokyonight').setup({ transparent = true })
            vim.cmd[[colorscheme tokyonight]]
	      '';
      }

      { # Nicer comments
        plugin = comment-nvim;
        config = toLua "require('Comment').setup()";
      }
      { # Autopair and highlight matching brackets {}
        plugin = nvim-autopairs;
        config = toLua "require('nvim-autopairs').setup {}";
      }

      { # Code completion
        plugin = nvim-cmp;
        config = toLuaFile ./plugins/cmp.lua;
      }
      luasnip
      cmp_luasnip
      friendly-snippets
      cmp-nvim-lsp

      { # Telescope
        plugin = telescope-nvim;
        config = toLuaFile ./plugins/telescope.lua;
      }
      telescope-fzf-native-nvim

      { # Treesitter
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
          p.tree-sitter-c
          p.tree-sitter-rust
        ]));
        config = toLuaFile ./plugins/treesitter.lua;
      }
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
    '';
  };
}
