-- Main Neovim configuration entry point
-- Load core configuration files

-- Bootstrap lazy.nvim
-- Force MSYS2 MinGW64 toolchain for this Neovim process
vim.env.PATH = "C:\\msys64\\mingw64\\bin;" .. (vim.env.PATH or "")
vim.env.MAKE = vim.env.MAKE or "mingw32-make"


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load configuration modules
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.commands")

-- Load plugins
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
  install = {
    colorscheme = { "catppuccin" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
})
