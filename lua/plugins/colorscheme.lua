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
			-- "modus" picks operandi or vivendi from 'background', which Nvim sets
			-- from the terminal and updates when the system theme changes.
			vim.cmd.colorscheme("modus")
		end,
	},
}
