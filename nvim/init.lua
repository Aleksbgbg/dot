-- Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
})

-- Catpuccin colour scheme
vim.cmd.colorscheme "catppuccin-frappe"

-- Treesitter config
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "lua",
    "make",
    "query",
    "rust",
    "vim",
    "vimdoc",
  },
  highlight = {
    enable = true,
  },
})
