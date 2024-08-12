return {

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      -- local actions = require("telescope.actions")
      require("telescope").setup({
        -- Navigation actions
        defaults = {
          hidden = true,
          no_ignore = true,
          layout_strategy = "vertical",
          layout_config = {
            height = 0.98,
            width = 0.99,
          },
          find_files = {
            prompt_title = 'Find Name of Files'
          },
          live_grep = {
            grep_open_files = true,
            prompt_title = 'Live Grep in Open Files',
          },

          mappings = {
            n = {
              ["<C-b>"] = "move_selection_previous"
            },
            i = {
              ["<C-b>"] = "move_selection_previous"
            }
          }
        },
      })
      -- Menu Hotkeys (Alphabetical)
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[F]ind [B]uffers" })
      vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = "[F]ind [C]oloscheme" })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind [F]iles" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "[F]ind [G]rep" })
      vim.keymap.set('n', '<leader>fh', builtin.command_history, { desc = "[F]ind Command [H]istory" })
      vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = "[F]ind [M]arks" })
      vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "[F]ind [O]ldfiles" })
      vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = "[F]ind [R]egisters" })
      vim.keymap.set('n', '<leader>fs', builtin.search_history, { desc = "[F]ind [S]earch History" })
      vim.keymap.set('n', '<leader>ft', builtin.help_tags, { desc = "[F]ind [H]elp Tags" })
      vim.keymap.set('n', '<leader>fv', builtin.vim_options, { desc = "[F]ind [V]im Options" })
      vim.keymap.set('n', '<leader>fw', builtin.spell_suggest, { desc = "[F]ind [W]ord Spell Suggest" })
      vim.keymap.set('n', '<leader>f/', function()
      end, { desc = '[F]ind [/] in Open Files' })
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
