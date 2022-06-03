local lsp_config = require("lspconfig")

local opts = { noremap=true, silent=true }
local keymap = vim.api.nvim_set_keymap

lsp_config.pyright.setup {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = false,
            },
        },
    },
}

keymap('n', '<leader>dk', ':lua vim.diagnostic.goto_prev()<cr>', opts)
keymap('n', '<leader>dj', ':lua vim.diagnostic.goto_next()<cr>', opts)
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', opts)
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', opts)
keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', opts)
keymap('n', 'sr', ':lua vim.lsp.buf.references()<cr>', opts)
keymap('n', '<leader>D', ':lua vim.lsp.buf.type_definition()<cr>', opts)

keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>', opts)
keymap('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<cr>', opts)

keymap('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<cr>', opts)
keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', opts)
keymap('n', '<leader>af', ':lua vim.lsp.buf.format()<cr>', opts)


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright' }
-- for _, lsp in pairs(servers) do
--     lsp_config[lsp].setup {
--     on_attach = on_attach,
--   }
-- end
