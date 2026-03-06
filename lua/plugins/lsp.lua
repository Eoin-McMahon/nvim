return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- 🔧 Diagnostic rendering settings
			vim.diagnostic.config({
				underline = true, -- disables squiggly lines
				virtual_text = false, -- disables inline error text
				update_in_insert = false,
			})
			vim.lsp.config("pyright", {
				settings = {
					python = {
						analysis = {
							diagnosticMode = "openFilesOnly",
							typeCheckingMode = "strict",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			})

			vim.lsp.enable("pyright")
			vim.lsp.enable("lua_ls")
		end,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
	},
}
