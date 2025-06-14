return {
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				view_options = {
					show_hidden = true,
					natural_order = true,
					is_always_hidden = function(name, _)
						return name == ".." or name == ".git"
					end,
				},
				win_options = {
					wrap = true,
				},
			})
		end,
	},
}
