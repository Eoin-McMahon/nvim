return {
	{
		"ahmedkhalf/project.nvim",
		config = function()
			-- Setup project.nvim
			require("project_nvim").setup({
				manual_mode = false,
				detection_methods = { "lsp", "pattern" },
				patterns = { ".git", "pyproject.toml", "setup.py" },
			})

			-- Load telescope-project extension
			local has_telescope, telescope = pcall(require, "telescope")
			if has_telescope then
				pcall(function()
					telescope.load_extension("projects")
				end)
			end

			-- Keymaps
			local builtin = require("telescope.builtin")
			local opts = { noremap = true, silent = true }

			vim.keymap.set(
				"n",
				"<leader>pf",
				builtin.find_files,
				vim.tbl_extend("force", opts, { desc = "Find files in project" })
			)
			vim.keymap.set(
				"n",
				"<leader>pg",
				builtin.live_grep,
				vim.tbl_extend("force", opts, { desc = "Search text in project" })
			)

			-- Always define <leader>pp, even if telescope-project fails
			vim.keymap.set("n", "<leader>pp", function()
				if has_telescope then
					local ok, _ = pcall(function()
						telescope.extensions.projects.projects()
					end)
					if not ok then
						print("Telescope projects extension not installed")
					end
				else
					print("Telescope not available")
				end
			end, vim.tbl_extend("force", opts, { desc = "Switch project" }))
		end,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-project.nvim",
		},
	},
}
