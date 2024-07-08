require('nvim-treesitter.configs').setup {
    ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "css", "html", "markdown", "latex" },
    auto_install = true,
    hightlight = { enable = true },
    indent = { enable = true },
    autopairs = { enable = true },
}
