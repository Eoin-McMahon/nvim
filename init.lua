require("config.lazy")

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Keep directory fixed
vim.opt.autochdir = false
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.cmd("lcd " .. vim.fn.getcwd())
	end,
})

vim.opt.clipboard = "unnamedplus"

vim.cmd("autocmd FileType * silent! lcd %:p:h")

-- Configure tabs and spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.wrap = true
vim.g.have_nerd_font = false
vim.opt.mouse = "a"

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Don't show the mode, since it's already in status line
vim.opt.showmode = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Dont auto change dir
vim.opt.autochdir = false

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>?", vim.diagnostic.open_float, { desc = "Open floating diagnostic" })
