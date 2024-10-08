local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

if vim.fn.filereadable(vim.fn.getcwd() .. '/project.godot') == 1 then
  local addr = './godot.pipe'
  if vim.fn.has 'win32' == 1 then
    addr = '127.0.0.1:6004'
  end
  vim.fn.serverstart(addr)
end

vim.opt.rtp:prepend(lazypath)

require("config.keymaps")
require("config.nvim_options")
require("lazy").setup("plugins")
