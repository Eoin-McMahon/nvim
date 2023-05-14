-- vim.o.background = "dark" -- or "light" for light mode
-- vim.g.gruvbox_material_better_performance = 1
--
-- vim.g.gruvbox_material_foreground = 'material'
-- vim.g.gruvbox_material_background = 'medium'
--
-- vim.cmd("colorscheme gruvbox-material")


-- For dark version.
if vim.g.started_by_firenvim == true then
    vim.o.background = "light"
else
    vim.o.background = "dark"
end

-- Set contrast.
-- vim.g.everforest_background = "hard" 
-- vim.g.everforest_better_performance = 1
-- vim.cmd("colorscheme everforest")

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

