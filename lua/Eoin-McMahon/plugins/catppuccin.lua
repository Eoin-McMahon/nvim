-- Set colour scheme
-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
-- vim.cmd [[colorscheme catppuccin]]

require("gruvbox").setup({
    contrast = "hard"
})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd("colorscheme gruvbox")

