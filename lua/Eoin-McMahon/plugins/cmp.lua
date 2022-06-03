-- Setup nvim-cmp.
local _cmp = require'cmp'

_cmp.setup{
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = _cmp.config.window.bordered(),
    documentation = _cmp.config.window.bordered(),
  },
  mapping = _cmp.mapping.preset.insert({
    ['<C-d>'] = _cmp.mapping.scroll_docs(-4),
    ['<C-u>'] = _cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = _cmp.mapping.complete(),
    ['<C-e>'] = _cmp.mapping.abort(),
    ['<CR>'] = _cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = _cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
}

-- Set configuration for specific filetype.
_cmp.setup.filetype('gitcommit', {
  sources = _cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
_cmp.setup.cmdline('/', {
  mapping = _cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
_cmp.setup.cmdline(':', {
  mapping = _cmp.mapping.preset.cmdline(),
  sources = _cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pyright'].setup {
  capabilities = capabilities
}

