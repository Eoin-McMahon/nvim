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

-- Move text up and down (insert mode)
keymap("i", "<c-Up>", "<Esc>:m .-2<CR>==gi", opts)
keymap("i", "<c-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("i", "<c-Down>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<c-j>", "<Esc>:m .+1<CR>==gi", opts)

-- Indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal escape to exit insert mode
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
keymap('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
keymap('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
keymap('t', '<C-l>', [[<C-\><C-n><C-W>l]], opts)

--kommentary
keymap("n", "<leader>k", "<Plug>kommentary_line_default", {})
keymap("x", "<leader>k", "<Plug>kommentary_visual_default", {})
