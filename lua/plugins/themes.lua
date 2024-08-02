return {
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,
  --   config = function()
  --     require("catppuccin").setup({
  --       transparent_background = true
  --     })
  --     vim.cmd.colorscheme "catppuccin-mocha"
  --   end
  -- },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1100,
    config = function()
      require("tokyonight").setup({
        transparent = true,
        terminalcolors = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent"
        },
        dim_inactive = true
      })
      vim.cmd.colorscheme "tokyonight-night"
    end
  },
  -- {
  --   "eldritch-theme/eldritch.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("eldritch").setup({
  --       transparent = true,
  --       terminal_colors = true,
  --       styles = {
  --         -- Style to be applied to different syntax groups
  --         -- Value is any valid attr-list value for `:help nvim_set_hl`
  --         comments = { italic = true },
  --         keywords = { italic = true },
  --         functions = {},
  --         variables = {},
  --         -- Background styles. Can be "dark", "transparent" or "normal"
  --         sidebars = "transparent_background", -- style for sidebars, see below
  --         floats = "transparent_background"    -- style for floating windows
  --       },
  --       on_colors = function(colors)
  --         colors.border_highlight = "#001111"
  --         colors.hint = colors.orange
  --         colors.error = "#ff0000"
  --       end
  --     })
  --     vim.cmd.colorscheme "eldritch"
  --   end
  -- },
}
