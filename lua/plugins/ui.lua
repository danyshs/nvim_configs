return {
  {

    --[[
    -- Index
    -- - Bufferline
    -- - Indent
    -- - Barbecue
    --]]

    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local bufferline = require('bufferline')
      bufferline.setup({
        options = {

          -- Config
          mode = "buffers",
          diagnostics = "nvim_lsp",
          always_show_bufferline = true,

          -- Formatting
          max_name_length = 18,
          tab_size = 18,
          offsets = {
            {
              filetype = "neo-tree",
              text = "Neo-tree",
              highlight = "Directory",
              text_align = "left"
            }
          },

          -- Icons
          buffer_close_icon = '󰅖',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',


          -- Styling
          separator_style = { "|", "|" },
          indicator = {
            -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'underline' -- Also 'icon', 'none'
          },

          -- Mouse Commands

        },
      })
    end
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      local toggleterm = require("toggleterm")
      toggleterm.setup({
        size = 20,
        -- Toggle Key
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          windblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal"
          }
        }
      })
    end
  },
  {

    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
    },
    config = function()
      local highlight = {
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hooks
      -- so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#0000EF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#0000DD" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#0000BB" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#0044AA" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#0088AA" })
      end)

      require("ibl").setup({
        indent = {
          highlight = highlight,
          char = ".",
        },
      })
    end
  },
  {

    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
    config = function()
      local barbecue = require("barbecue")
      local barbecueui = require("barbecue.ui")
      barbecue.setup({
        --theme = "tokyonight"
        theme = "eldritch"
      })
      vim.keymap.set('n', '<leader>tb', barbecueui.toggle, { desc = "[T]oggle [B]arbecue" })
      local bbqout = function()
        barbecueui.navigate(-2)
      end
      local bbqback = function()
        barbecueui.navigate(-1)
      end
      vim.keymap.set('n', '<leader>bb', bbqout, { desc = "Go to ancestor scope" })
      vim.keymap.set('n', '<leader>bd', bbqback, { desc = "Go to beginning of scope" })
    end
  },
  {

    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          -- theme = "eldritch",
          theme = "tokyonight",
          -- section_separators = { left = '', right = '' },
          -- component_separators = { left = '', right = '' }
        },
      })
    end,
  }
}
