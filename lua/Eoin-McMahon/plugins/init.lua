local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Define all plugins
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself

    -- COLORSCHEMES
    use { "sainnhe/gruvbox-material" }
    use { "sainnhe/everforest" }
    use { "catppuccin/nvim", as = "catppuccin" }


    use "folke/which-key.nvim" -- show keymaps on screen

    use "kyazdani42/nvim-tree.lua" -- tree explorer
    use "kyazdani42/nvim-web-devicons" -- icons
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'wiliamks/nice-reference.nvim'}
    use {"ellisonleao/glow.nvim"} --markdown preview
    use "lukas-reineke/indent-blankline.nvim" -- lines for indentation
    use "neovim/nvim-lspconfig" -- Collection of configurations for the built-in LSP client
    use { "williamboman/mason.nvim" } -- Helper for installing lsp servers/linters
    use "williamboman/nvim-lsp-installer" -- automatically install lsp servers
    use "nvim-treesitter/nvim-treesitter" -- Better parsing of files that lsp will use
    use { 'anuvyklack/pretty-fold.nvim',
        config = function()
        require('pretty-fold').setup()
        end
    }

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"

    use { -- neovim in the browser!
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end 
    }

    use "windwp/nvim-autopairs" -- automatically close opened brackets
    use "numToStr/Comment.nvim" -- automatic code comment handling
    use { -- startup screen
      "startup-nvim/startup.nvim",
      requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
      config = function()
        require"startup".setup()
      end
}

    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
