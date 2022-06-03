local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- Move text up and down (visual mode)
keymap("v", "<c-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<c-Up>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<c-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<c-k>", ":m '<-2<CR>gv=gv", opts)

-- Indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

