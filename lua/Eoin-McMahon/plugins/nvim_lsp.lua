local nvim_lsp = require("lspconfig")
local nvim_lsp_installer = require("nvim-lsp-installer")

-- automatically install language servers
nvim_lsp_installer.setup {
  automatic_installation = true
}

-- list of different language servers
local servers = { 'pyright', 'cmake' }

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

local config = {
	virtual_text = false,
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)

-- setup each language server
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
  }
end

