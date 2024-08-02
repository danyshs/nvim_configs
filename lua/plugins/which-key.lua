return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add({
      { "<leader>b",   group = "[B]uffer" },
      { "<leader>b_",  hidden = true },
      { "<leader>f",   group = "[f]ind Fuzzy" },
      { "<leader>f_",  hidden = true },
      { "<leader>h",   group = "Git [H]unk" },
      { "<leader>h_",  hidden = true },
      { "<leader>m",   group = "[M]arks" },
      { "<leader>m_",  hidden = true },
      { "<leader>ma",  group = "[M]arks: [A]ll" },
      { "<leader>ma_", hidden = true },
      { "<leader>mf",  group = "[M]arks for [F]iles" },
      { "<leader>mf_", hidden = true },
      { "<leader>n",   group = "[N]o (highlights)" },
      { "<leader>n_",  hidden = true },
      { "<leader>q",   group = "[Q]uit" },
      { "<leader>q_",  hidden = true },
      { "<leader>r",   group = "[R]ename" },
      { "<leader>r_",  hidden = true },
      { "<leader>t",   group = "[T]oggle" },
      { "<leader>t_",  hidden = true },
      { "<leader>v",   group = "[V]iew" },
      { "<leader>v_",  hidden = true },
      { "<leader>w",   group = "[W]indows and [W]orkspaces" },
      { "<leader>w_",  hidden = true },
    })
    -- visual mode
    require('which-key').add({

      { "<leader>h", desc = "Git [H]unk", mode = "v" }
    })
  end
}
