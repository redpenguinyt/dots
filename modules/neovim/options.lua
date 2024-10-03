-- neovim/options.lua

-- Maps <Leader> in keybindings to space bar
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clipboard fix
vim.o.clipboard = 'unnamedplus'

vim.o.signcolumn = 'yes'
vim.o.termguicolors = true
vim.o.updatetime = 300

vim.o.number = true
vim.o.linebreak = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.mouse = ''
