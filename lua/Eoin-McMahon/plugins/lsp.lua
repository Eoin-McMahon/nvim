require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 120
        },
        flake8 = {
          ignore = {'W391'},
          maxLineLength = 79
        },

      }
    }
  }
}
