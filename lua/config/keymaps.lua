vim.g.mapleader = " "

vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>', { silent = true })

vim.keymap.set({ "x", "n", "s" }, "<leader>s", "<cmd>w<CR><ESC>", { desc = "Save File" })

-- Highlight
vim.keymap.set("n", "<leader>nh", "<cmd>nohl<cr>", { desc = "Quit Highlighted Text" })

-- Quit
vim.keymap.set("n", "<leader>qc", "<cmd>q<cr>", { desc = "Quit current" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
vim.keymap.set("n", "<leader>qw", "<cmd>wq<cr>", { desc = "Save and Quit" })
vim.keymap.set("n", "<leader>qf", "<cmd>q!<cr>", { desc = "Quit Force" })
vim.keymap.set("n", "<leader>qa", "<cmd>qa!<cr>", { desc = "Quit All Force" })
-- Window Management

vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })

-- Window Panel Navigation

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Window Resize

vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move Half Up and Center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move Half Down and Center" })

-- Navigation: Tabs

vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<tab>", "<cmd>bn<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<C-w><C-w>", "<cmd>bd<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<S-tab>", "<cmd>bp<cr>", { desc = "Previous Tab" })

vim.keymap.set('n', "<leader>bc", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin" })
vim.keymap.set('n', "<leader>bC", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Delete Non-Pinned Buffers" })
vim.keymap.set('n', "<leader>bq", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Delete Other Buffers" })

-- SECTION START: Plugin Keymaps

-- Indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Lazy Vim
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Markdown Preview

vim.keymap.set("n", "<leader>vm", "<cmd>MarkdownPreview<cr>", { desc = "Open markdown preview" })

-- Open Link
vim.keymap.set("n", "<leader>ol", "$T(gx", { desc = "[O]pen [L]ink", remap = true })
vim.keymap.set("n", "<leader>fl", "/https:<CR>", { desc = "[F]ind [L]ink", remap = true })
vim.keymap.set("n", "<leader>ofl", "<leader>fl<leader>ol", { desc = "[O]pen [F]ind [L]ink", remap = true })
-- Dap and Dap UI

-- vim.keymap.set('n', '<leader>dt', "<cmd>DapUiToggle<CR>", { desc = "[D]ebug: UI Toggle" })

-- Zen Mode


vim.keymap.set("n", "<leader>nb", "<cmd>:Noice telescope<CR>", { desc = "Show [N]otification [B]ar" })

-- SECTION END: Plugin Keymaps
--

vim.keymap.set("n", "<leader>", "<cmd>ZenMode<CR>", { desc = "[CTRL] []" })
