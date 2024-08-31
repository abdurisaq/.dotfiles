vim.g.mapleader = " " 
vim.keymap.set("n", "<leader>pv",vim.cmd.Ex)
vim.keymap.set('n', '<C-a>', '<C-u>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>/', ':nohl<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
