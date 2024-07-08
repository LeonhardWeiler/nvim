-- Leader key
vim.g.mapleader = " "

-- Existing keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "<C-a>", "ggVG")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
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
vim.keymap.set("i", "<Up>", "<Nop>")
vim.keymap.set("i", "<Left>", "<Nop>")
vim.keymap.set("i", "<Right>", "<Nop>")
vim.keymap.set("i", "<Down>", "<Nop>")
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

function RemoveNonTexFiles()
  local cwd = vim.fn.getcwd()
  local command = 'find ' .. cwd .. ' -type f ! -name "*.tex" -delete'
  vim.fn.system(command)
  vim.notify("Removed all non-.tex files in the directory")
end

vim.api.nvim_set_keymap('n', '<leader>lr', ':lua RemoveNonTexFiles()<CR>', { noremap = true, silent = true })

function RemoveNonTexAndPdfFiles()
  local cwd = vim.fn.getcwd()
  local command = 'find ' .. cwd .. ' -type f ! -name "*.tex" ! -name "*.pdf" -delete'
  os.execute(command .. ' > /dev/null 2>&1')
  vim.notify("Removed all non-.tex and non-.pdf files in the directory")
end

vim.api.nvim_set_keymap('n', '<leader>lp', ':lua RemoveNonTexAndPdfFiles()<CR>', { noremap = true, silent = true })

local zathura_pid = nil

function CompileLatex()
  local filename = vim.fn.expand('%')
  vim.fn.jobstart('pdflatex ' .. filename, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
    end,
    on_stderr = function(_, data)
    end,
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("Compilation finished successfully.")
      else
        vim.notify("Compilation failed.", vim.log.levels.ERROR)
      end
    end,
  })
end

function ToggleZathura()
  local filename = vim.fn.expand('%:r')
  if zathura_pid then
    vim.fn.system('kill ' .. zathura_pid)
    zathura_pid = nil
    vim.notify("Closed Zathura")
  else
    zathura_pid = tonumber(vim.fn.system('zathura ' .. filename .. '.pdf & echo $!'))
    vim.notify("Opened Zathura")
  end
end

vim.api.nvim_set_keymap('n', '<leader>p', ':lua CompileLatex()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>z', ':lua ToggleZathura()<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.tex',
  callback = function()
    CompileLatex()
  end,
})
