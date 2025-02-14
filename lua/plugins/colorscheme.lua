return {
	{
		"neanias/everforest-nvim",
		version = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			-- vim.cmd([[colorscheme everforest]])
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		flavour = "latte", -- latte, frappe, macchiato, mocha
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
}
