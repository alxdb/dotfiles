-- vanilla neovim config
require("config")

-- bootstrap lazy.nvim
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
vim.opt.rtp:prepend(lazypath)

-- import all modules from the config directory
require("lazy").setup({
  spec = { import = "plugins" },
  install = { colorscheme = { "ayu" } },
  change_detection = { notify = false },
})
