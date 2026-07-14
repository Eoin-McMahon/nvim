require("config.lazy")

-- Window/pane navigation is handled by vim-tmux-navigator (see plugins/navigation.lua),
-- which falls back to plain window movement outside tmux.

-- LSP rename
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "LSP Rename" })

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

-- Support syntax highlighting in gotmpl
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.gotmpl", "*.tpl", "*.yaml.gotmpl", "*.tpl.gotmpl", "templates/*.yaml" },
	callback = function()
		vim.bo.filetype = "gotmpl"
	end,
})

vim.opt.autochdir = false

vim.opt.clipboard = "unnamedplus"

vim.cmd("autocmd FileType * silent! lcd %:p:h")

-- Configure tabs and spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.mouse = "a"

-- nerd font
vim.g.have_nerd_font = true

-- Diagnostic signs
local signs = {
	Error = "",
	Warn = "",
	Info = "",
	Hint = "󰌵",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "auto:1"
vim.opt.colorcolumn = "88"

-- get rid of cmdline when not in use
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
-- hides cursor position in cmdline
vim.opt.ruler = false

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Spell checker
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.spelloptions = "camel"

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>?", vim.diagnostic.open_float, { desc = "Open floating diagnostic" })
