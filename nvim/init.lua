vim.g.mapleader = ","
vim.api.nvim_set_keymap('n', '<Leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>c', ':NvimTreeClose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader><Right>', ':NvimTreeResize +1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader><Left>', ':NvimTreeResize -1<CR>', { noremap = true, silent = true })
require("config.lazy")

