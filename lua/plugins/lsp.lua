return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").pyright.setup({})
			require("lspconfig").lua_ls.setup({})
		end,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename),
	},
}
