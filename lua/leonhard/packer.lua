vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "Shatur/neovim-ayu", as = "ayu" }
  use({
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        icons = true,
      }
    end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('nvim-tree/nvim-web-devicons')
  use('lewis6991/gitsigns.nvim')
  use('lukas-reineke/indent-blankline.nvim')
  use('theprimeagen/harpoon')
  use('feline-nvim/feline.nvim')
  use('mattn/emmet-vim')
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
  }
  use('prettier/vim-prettier')
  use({
    "aurum77/live-server.nvim",
    run = function()
      require"live_server.util".install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  })
  use('github/copilot.vim')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  use("folke/zen-mode.nvim")
end)
