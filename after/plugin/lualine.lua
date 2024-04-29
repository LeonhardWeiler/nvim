require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = '',
    component_separators = '',
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {"os.date('%c')", 'data', "require'lsp-status'.status()"},
    lualine_y = {'filetype'},
    lualine_z = {'location'}
  },
  extensions = {'fugitive', 'mason', 'trouble'}
}
