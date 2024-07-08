require('lualine').setup {
  options = {
    theme = 'auto',
    icons_enabled = true,
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
    lualine_c = {
      {'',
        file_status = true,
        newfile_status = true,
        path = 1,
        symbols = {
          modified = '',
          readonly = '',
          unnamed = '',
          newfile= '',
        }
      },
    },
    lualine_x = {'filename'},
    lualine_y = {'filetype'},
    lualine_z = {'location'}
  },
  extensions = {'fugitive', 'mason', 'trouble'}
}
