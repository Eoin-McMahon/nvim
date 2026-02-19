return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp", commit = "5af77f5" },
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				completion = { completeopt = "menu,menuone,noinsert" },
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete({}),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "codeium" },
					-- { name = "luasnip" },
					-- { name = "path" },
					-- { name = "orgmode" },
				},
			})
		end,
	},
}
