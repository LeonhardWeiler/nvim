require("leonhard.remap")
require("leonhard.packer")
require("leonhard.set")

local augroup = vim.api.nvim_create_augroup
local leonhardGroup = augroup('leonhard', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
  require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

autocmd({"BufWritePre"}, {
  group = leonhardGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- This is necessary for VimTeX to load properly.
-- vim.cmd('filetype plugin indent on')

-- This enables Vim's and neovim's syntax-related features.
-- vim.cmd('syntax enable')

-- vim.g.vimtex_view_general_options = 'file:@pdf\\#src:@line@tex'

-- vim.g.maplocalleader = ","

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
