vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'olivercederborg/poimandres.nvim'
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use 'rcarriga/nvim-dap-ui'
  use 'nvim-treesitter/playground'
  use 'nvim-neotest/nvim-nio'
  use 'lewis6991/gitsigns.nvim'
  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'mxsdev/nvim-dap-vscode-js'
  use 'ThePrimeagen/vim-be-good'
  use 'nvim-tree/nvim-web-devicons'
  use 'lervag/vimtex'
  use 'github/copilot.vim'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'theprimeagen/harpoon'
  use 'mattn/emmet-vim'
  use 'prettier/vim-prettier'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lualine/lualine.nvim'

  use {
    'microsoft/vscode-js-debug',
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  }

  use({
    'iamcco/markdown-preview.nvim',
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }
  })

  use {
    'windwp/nvim-autopairs',
    event = "InsertEnter"
  }

  use({
    'aurum77/live-server.nvim',
    run = function()
      require"live_server.util".install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" }
  })

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'}
    }
  }
end)
