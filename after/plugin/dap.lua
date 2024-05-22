local dap = require("dap")
require("nvim-dap-virtual-text").setup()

-- Set keymaps to control the debugger
vim.keymap.set('n', '<F2>', require 'dap'.restart)
vim.keymap.set('n', '<F3>', require 'dap'.disconnect)
vim.keymap.set('n', '<F5>', require 'dap'.continue)
vim.keymap.set('n', '<F9>', require 'dap'.step_into)
vim.keymap.set('n', '<F10>', require 'dap'.step_over)
vim.keymap.set('n', '<F12>', require 'dap'.step_out)
vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)
vim.keymap.set('n', '<leader>cb', require 'dap'.clear_breakpoints)
vim.keymap.set('n', '<leader>B', function()
  require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
vim.keymap.set('n', '<leader>ui', require 'dapui'.toggle)

require("dap-vscode-js").setup({
  debugger_path = 'C:/Users/LeonhardWeiler/AppData/Local/nvim-data/site/pack/packer/opt/vscode-js-debug',
  adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' },
})

local js_based_languages = { "typescript", "javascript", "typescriptreact" }

for _, language in ipairs(js_based_languages) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Start Chrome with \"localhost\"",
      file = "${workspaceFolder}/html/index.html",
    }
  }
end

require("dapui").setup()
