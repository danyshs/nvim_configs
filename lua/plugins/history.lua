return {
    "mbbill/undotree",
    vim.keymap.set('n', '<leader>tu', vim.cmd.UndotreeToggle, { desc = "Undo tree" })
}
