return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'mason-org/mason.nvim',
  },

  config = function()
    local dap = require('dap')

    dap.adapters["pwa-node"] = {
      type = "server",
      port = "${port}",
      executable = {
        command = "js-debug-adapter",
        args = { "${port}" },
      },
    }

    dap.configurations.typescript = {
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach to process ID",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
    }

    -- Keybinds
    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "DAP: Run/Continue" })
    vim.keymap.set("n", "<Leader>dj", dap.step_over, { desc = "DAP: Step Over" })
    vim.keymap.set("n", "<Leader>dl", dap.step_into, { desc = "DAP: Step Into" })
    vim.keymap.set("n", "<Leader>dk", dap.step_out, { desc = "DAP: Step Out" })
    vim.keymap.set("n", "<Leader>dt", dap.terminate, { desc = "DAP: Terminate" })
    vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "DAP: REPL" })
    vim.keymap.set("n", "<Leader>dh", dap.repl.open, { desc = "DAP: REPL" })
    vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end)
    vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
      require('dap.ui.widgets').preview()
    end)
    vim.keymap.set('n', '<Leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set('n', '<Leader>ds', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end)
  end
}
