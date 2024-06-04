-- Leader key
vim.g.mapleader = " "

-- Existing keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>r", "\"_dp")

vim.keymap.set('n','y','"+y')
vim.keymap.set('n','yy','"+yy')
vim.keymap.set('n','Y','"+Y')
vim.keymap.set('x','y','"+y')
vim.keymap.set('x','Y','"+Y')

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

-- Unbind keys
vim.keymap.set("n", "<Enter>", "<Nop>")
vim.keymap.set("n", "-", "<Nop>")
vim.keymap.set("n", "+", "<Nop>")
vim.keymap.set("n", ">", "<Nop>")
vim.keymap.set("n", "<", "<Nop>")
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Backspace>", "<Nop>")
vim.keymap.set("n", "<F1>", "<Nop>")
vim.keymap.set("n", "<Space>", "<Nop>")

vim.keymap.set("n", "<Space>vh", ":vsplit<CR>")
vim.keymap.set("n", "<Space>vs", ":split<CR>")
vim.keymap.set("n", "<Space>vt", ":tabnew<CR>")
vim.keymap.set("n", "<A-S-c>", ":close<CR>")

vim.keymap.set("n", "<A-S-h>", "<C-w>H")
vim.keymap.set("n", "<A-S-j>", "<C-w>J")
vim.keymap.set("n", "<A-S-k>", "<C-w>K")
vim.keymap.set("n", "<A-S-l>", "<C-w>L")

vim.keymap.set("n", "-", ":resize -2<CR>")
vim.keymap.set("n", "+", ":resize +2<CR>")
vim.keymap.set("n", ">", ":vertical resize +2<CR>")
vim.keymap.set("n", "<", ":vertical resize -2<CR>")

vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")
