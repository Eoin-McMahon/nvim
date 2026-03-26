return {
	{
		"miikanissi/modus-themes.nvim",
		priority = 1000,
		config = function()
			-- load the colorscheme here
			require("modus-themes").setup({
				variants = {
					modus_operandi = "tinted", -- Set variant for `modus_operandi` style
					modus_vivendi = "tinted", -- Set variant for `modus_vivendi` style
				},
			})
			vim.cmd([[colorscheme modus_operandi]])
		end,
	},
}
