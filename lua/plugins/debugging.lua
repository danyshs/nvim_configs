return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require('mason-nvim-dap').setup({

        automatic_installation = true,

        ensure_installed = {
          "codelldb"
        },

        handlers = {}
      })
    end
  },

  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
        -- Set icons to characters that are more likely to work in every terminal.
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        }
      })
      dap.adapters.godot = {
        type = 'server',
        host = '127.0.0.1',
        port = 6006
      }
      dap.configurations.gdscript = {
        {
          type = "godot",
          request = "launch",
          name = "Launch scene",
          project = "${workspaceFolder}",
        }
      }
      -- Dap UI Config
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      vim.keymap.set('n', '<leader>dd', dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
      vim.keymap.set('n', '<F3>', dap.continue, { desc = 'Debug: Start/Continue' })
      vim.keymap.set('n', '<F4>', dap.step_into, { desc = 'Debug: Step Into' })
      vim.keymap.set('n', '<F5>', dap.step_over, { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<F2>', dap.step_back, { desc = 'Debug: Step Back' })
      vim.keymap.set('n', '<F1>', dap.step_out, { desc = 'Debug: Step Out' })
      -- Toggle to see last session result.
      -- Without this, you can't see session output in case of unhandled exception.
      vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })
      vim.keymap.set('n', '<leader>dr', dap.restart, { desc = 'Debug: Restart' })
      vim.keymap.set('n', '<leader>td', dapui.toggle, { desc = 'Debug: [T]oggle debug UI' })
      vim.keymap.set('n', '<leader>dq', ":lua require('dapui').open({reset = true})<CR>", {})
      vim.keymap.set('n', '<leader>dD', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = 'Debug: Set Breakpoint' })
    end
  }
}
