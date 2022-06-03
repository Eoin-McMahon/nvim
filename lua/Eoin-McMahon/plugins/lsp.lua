local lsp_installer = require("nvim-lsp-installer")

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

lsp_installer.on_server_ready(function(server)
    local options = {
      settings = {
        Lua = { -- removes annoying vim not gloval variable warnings
          diagnostics = { globals = {  'vim' } }
        },
       workspace = {
        --Make the server aware of Neovim runtime files
        library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
      }

      }
    }
    server:setup(options)
end)

 -- lsp keymaps
keymap('n', '<space>d', ':lua vim.diagnostic.open_float({focus = false})<cr>', {})
keymap('n', '<leader>dk', ':lua vim.diagnostic.goto_prev()<cr>', {})
keymap('n', '<leader>dj', ':lua vim.diagnostic.goto_next()<cr>', {})

keymap('n', 's', '<Nop>', {})
keymap('n', 'sd', ':lua vim.lsp.buf.definition()<cr>', {})
keymap('n', 'sD', ':lua vim.lsp.buf.declaration()<cr>', {})
keymap('n', 'si', ':lua vim.lsp.buf.implementation()<cr>', {})
keymap('n', 'sr', ':lua vim.lsp.buf.references()<cr>', {})
keymap('n', '<leader>D', ':lua vim.lsp.buf.type_definition()<cr>', {})

keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>', {})
keymap('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<cr>', {})

keymap('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<cr>', {})
keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', {})
keymap('n', '<leader>gf', ':lua vim.lsp.buf.format()<cr>', {})

