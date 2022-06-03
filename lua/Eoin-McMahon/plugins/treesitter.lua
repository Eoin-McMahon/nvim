local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ignore_install = { "phpdoc", "tree-sitter-phpdoc" }, -- broken on m1 mac

  highlight = {
    enable = true, -- enable highlighting
  },
  indent = {
    enable = true, -- enable smart indentation
  }
}
local tree_sitter_config = require 'nvim-treesitter.configs'

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 20 -- only fold really large nests by default
