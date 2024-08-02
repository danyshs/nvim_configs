return {
  --[
  --
  --]


  {
    'numToStr/Comment.nvim',
    opts = {}
  },
  -- Useful for getting pretty icons, but requires a Nerd Font.
  {
    'nvim-tree/nvim-web-devicons',
    enabled = vim.g.have_nerd_font
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },

    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    {
      "tpope/vim-unimpaired"
    },

  }
}
