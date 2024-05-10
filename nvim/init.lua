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
  { "rhysd/vim-clang-format" },
  { "lambdalisue/vim-suda" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup {}
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } }
  },
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

-- Treesitter Android.bp plugin
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.bp = {
  install_info = {
    url = "~/dev/tree-sitter-bp", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "bp", -- if filetype does not match the parser name
}
