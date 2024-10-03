-- nvim/lua/options.lua

-- Maps <Leader> in keybindings to space bar
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clipboard fix
vim.o.clipboard = 'unnamedplus'

vim.o.number = true
vim.o.linebreak = true

vim.o.signcolumn = 'yes'

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.updatetime = 300

vim.o.mouse = ''

-- Transparent background
vim.o.termguicolors = true
vim.cmd('hi Normal guibg=none')

-- Lightline config
vim.cmd([[
  let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \       [ 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \       [ 'percent' ],
    \       [ 'filetype' ] ],
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
  \ }
]])
