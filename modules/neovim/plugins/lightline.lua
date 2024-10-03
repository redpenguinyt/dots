vim.g.lightline = {
    colorscheme = 'wombat',
    active = {
        left = { { 'mode', 'paste' }, { 'readonly', 'filename', 'modified' } },
        right = { { 'lineinfo' }, { 'percent' }, { 'filetype' } },
    },
    component_function = { gitbranch = 'FugitiveHead' },
}
