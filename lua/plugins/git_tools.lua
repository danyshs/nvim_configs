-- local function git_commit_and_push()
--   vim.cmd('!git add .')
--
--   local commit_message = vim.fn.input('Enter commit message: ')
--   local escaped_message = vim.fn.shellescape(commit_message)
--   local commit_command = string.format('git commit -m %s', escaped_message)
--   vim.fn.system(commit_command)
--
--   vim.cmd('!git push')
-- end
--
-- local function git_detach()
--   local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
--   vim.fn.system('gh repo delete ' .. vim.fn.shellescape(dir_name) .. ' --yes')
--   vim.fn.system('git remote remove origin')
--
--   -- Cross-platform removal of .git directory
--   local git_dir = vim.fn.getcwd() .. '/.git'
--   vim.fn.delete(git_dir, 'rf')
-- end
--
-- local function git_create_repo()
--   vim.fn.system('git init .')
--   local readme_message = vim.fn.input('Enter README message: ')
--   local file = io.open('README.md', 'w')
--   if file then
--     file:write(readme_message)
--     file:close()
--   else
--     print("Failed to create README.md")
--     return
--   end
--   vim.fn.system('git branch -m master main')
--   vim.fn.system('git add .')
--   local commit_message = vim.fn.input('Enter commit message: ')
--   vim.fn.system('git commit -m ' .. vim.fn.shellescape(commit_message))
--   local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
--   vim.fn.system('gh repo create ' .. vim.fn.shellescape(dir_name) .. ' --private --source=. --remote=origin --push')
-- end
--

local function notify(message, level)
  vim.notify(message, level or vim.log.levels.INFO)
end

local function git_commit_and_push()
  local git_status = vim.fn.system('git status --porcelain')
  if git_status == '' then
    notify("No changes to commit", vim.log.levels.WARN)
    return
  end

  vim.fn.system('git add .')
  notify("Changes staged for commit")

  local commit_message = vim.fn.input('Enter commit message: ')
  if commit_message == '' then
    notify("Commit cancelled: No message provided", vim.log.levels.WARN)
    return
  end

  local escaped_message = vim.fn.shellescape(commit_message)
  local commit_command = string.format('git commit -m %s', escaped_message)
  vim.fn.system(commit_command)
  notify("Changes committed: " .. commit_message)

  local push_result = vim.fn.system('git push')
  if vim.v.shell_error ~= 0 then
    notify("Push failed: " .. push_result, vim.log.levels.ERROR)
  else
    notify("Changes pushed successfully")
  end
end


local function git_detach()
  local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')

  -- Replace spaces with dashes
  local formatted_dir_name = dir_name:gsub(" ", "-")

  -- Check if .git directory exists
  if vim.fn.isdirectory('.git') == 0 then
    vim.notify("No git repository found in current directory", vim.log.levels.WARN)
    return
  end

  -- Directly wrap the formatted directory name in quotes
  local delete_command = 'gh repo delete "' .. formatted_dir_name .. '" --yes'

  local delete_result = vim.fn.system(delete_command)
  if vim.v.shell_error ~= 0 then
    vim.notify("Failed to delete remote repository: " .. delete_result, vim.log.levels.ERROR)
    return
  end
  vim.notify("Remote repository deleted")

  vim.fn.system('git remote remove origin')
  vim.notify("Remote 'origin' removed")

  local git_dir = vim.fn.getcwd() .. '/.git'
  vim.fn.delete(git_dir, 'rf')
  vim.notify("Local .git directory removed")
end

local function git_create_repo()
  if vim.fn.isdirectory('.git') == 1 then
    notify("Git repository already exists in current directory", vim.log.levels.WARN)
    return
  end

  local init_result = vim.fn.system('git init .')
  if vim.v.shell_error ~= 0 then
    notify("Failed to initialize git repository: " .. init_result, vim.log.levels.ERROR)
    return
  end
  notify("Git repository initialized")

  local readme_message = vim.fn.input('Enter README message: ')
  local file = io.open('README.md', 'w')
  if file then
    file:write(readme_message)
    file:close()
    notify("README.md created")
  else
    notify("Failed to create README.md", vim.log.levels.ERROR)
    return
  end

  vim.fn.system('git branch -m master main')
  notify("Default branch renamed to 'main'")

  vim.fn.system('git add .')
  local commit_message = vim.fn.input('Enter commit message: ')
  if commit_message == '' then
    notify("Commit cancelled: No message provided", vim.log.levels.WARN)
    return
  end

  local commit_result = vim.fn.system('git commit -m ' .. vim.fn.shellescape(commit_message))
  if vim.v.shell_error ~= 0 then
    notify("Failed to commit: " .. commit_result, vim.log.levels.ERROR)
    return
  end
  notify("Initial commit created")

  local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
  local create_result = vim.fn.system('gh repo create ' ..
    vim.fn.shellescape(dir_name) .. ' --private --source=. --remote=origin --push')
  if vim.v.shell_error ~= 0 then
    notify("Failed to create remote repository: " .. create_result, vim.log.levels.ERROR)
  else
    notify("Remote repository created and changes pushed")
  end
end

return {


  --[[
    -- Index
    -- - git fugitive
    --]]

  {
    "tpope/vim-fugitive",

    vim.keymap.set("n", "<leader>G", "<cmd>G<CR>", { desc = "[G]it Status" }),
    --vim.keymap.set("n", "<leader>g?", "<cmd>G?<CR>", { desc = "[G]it Assist" }),
    --vim.keymap.set("n", "<leader>g!", "<cmd>Gvdiffsplit!<CR>", { desc = "[G]it Conflict" }),
    vim.keymap.set("n", "<leader>gB", git_detach, { desc = "[G]it [B]anish [R]epository" }),
    vim.keymap.set("n", "<leader>gC", git_create_repo, { desc = "[G]it [C]reate [R]epo" }),
    vim.keymap.set("n", "<leader>gu", git_commit_and_push, { desc = "[G]it [U]pdate Lazily" }),
    vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", { desc = "[G]it [D]iff" }),
    vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "[G]it [B]lame" }),
    vim.keymap.set("n", "<leader>gl", "<cmd>Git log<CR>", { desc = "[G]it [L]og" }),
    vim.keymap.set("n", "<leader>ga", "<cmd>Git add .<CR>", { desc = "[G]it [A]dd All" }),
    vim.keymap.set("n", "<leader>gps", "<cmd>Git push<CR>", { desc = "[G]it [P]u[s]h" }),
    vim.keymap.set("n", "<leader>gpl", "<cmd>Git pull<CR>", { desc = "[G]it [P]u[l]l" }),
    vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "[G]it [C]ommit" }),
    --vim.keymap.set("n", "<leader>gf", "<cmd>Git fetch<CR>", { desc = "[G]it [F]etch" }),
    --vim.keymap.set("n", "<leader>gm", "<cmd>Git merge<CR>", { desc = "[G]it [M]erge" }),
    vim.keymap.set("n", "<leader>gr", "<cmd>Git rebase<CR>", { desc = "[G]it [R]ebase" }),

  },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },

      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', '<leader>hn', function()
          if vim.wo.diff then
            vim.cmd.normal { '<leader>hn', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '<leader>hN', function()
          if vim.wo.diff then
            vim.cmd.normal { '<leader>hN', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
        map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
        map('n', '<leader>hl', gitsigns.preview_hunk, { desc = 'git [L]ook at hunk' })
        map('n', '<leader>hb', gitsigns.blame_line, { desc = 'git [b]lame line' })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
        map('n', '<leader>hD', function()
          gitsigns.diffthis '@'
        end, { desc = 'git [D]iff against last commit' })
        -- Toggles
        map('n', '<leader>tg', gitsigns.toggle_current_line_blame, { desc = '[T]oggle [g]it show [b]lame line' })
        map('n', '<leader>hD', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
      end,
    },
  },
}
