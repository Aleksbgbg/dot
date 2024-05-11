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
  { "lambdalisue/vim-suda" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },
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
    "glsl",
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

vim.filetype.add({
  extension = {
    vert = "glsl",
    geom = "glsl",
    tesc = "glsl",
    tese = "glsl",
    frag = "glsl",
    mesh = "glsl",
    task = "glsl",
    comp = "glsl",
  },
})

-- Nvim Tree config
require("nvim-tree").setup()
