return {
	{
		"Exafunction/codeium.nvim",
		cmd = "Codeium",
		event = "InsertEnter",
		build = ":Codeium Auth",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		opts = {
			enable_events = true,
			enable_cmp_source = vim.g.ai_cmp,
			virtual_text = {
				enabled = not vim.g.ai_cmp,
			},
		},
	},
}
