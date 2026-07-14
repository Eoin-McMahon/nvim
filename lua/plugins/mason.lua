return {
	{ "mason-org/mason.nvim", version = "^1.0.0", opts = {} },
	{ "mason-org/mason-lspconfig.nvim", version = "^1.0.0", opts = {} },
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"basedpyright",
				"lua-language-server",
				"stylua",
				"black",
				"isort",
				"ruff",
				"debugpy",
			},
		},
	},
}
