return {
	{
		"DrKJeff16/project.nvim",
		dependencies = { "folke/snacks.nvim" },
		config = function()
			require("project").setup({
				manual_mode = false,
				patterns = { ".git", "pyproject.toml", "setup.py" },
				snacks = { enabled = true },
			})

			-- Switch project via the snacks.nvim picker
			vim.keymap.set("n", "<leader>p", function()
				require("project.extensions.snacks").pick()
			end, { noremap = true, silent = true, desc = "Switch project" })
		end,
	},
}
