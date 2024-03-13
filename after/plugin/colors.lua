require("catppuccin").setup({
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    integrations = {
        treesitter = true,
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
