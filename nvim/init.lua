-- Native remappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap split navigation to home row
map("n", "<C-w>;", "<C-w>l", opts)
map("n", "<C-w>l", "<C-w>k", opts)
map("n", "<C-w>k", "<C-w>j", opts)
map("n", "<C-w>j", "<C-w>h", opts)

-- LSP
vim.keymap.set("n", "<C-k>", vim.lsp.buf.code_action)

-- Automatic formatting
vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd(
  "BufWritePost",
  {
    pattern = "*.rs",
    group = "AutoFormat",
    callback = function()
      vim.cmd("lua vim.lsp.buf.format()")
    end,
  }
)

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
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "neovim/nvim-lspconfig" },
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" },
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
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {},
    version = "^1.8.0", -- only update when a new 1.x version is released
  },
})

-- Catpuccin colour scheme
vim.cmd.colorscheme "catppuccin-frappe"

-- Lualine config
require("lualine").setup()

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

-- LSP
local lspconfig = require("lspconfig")
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      imports = {
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    }
  }
})

-- Nvim Tree config
require("nvim-tree").setup()

-- Barbar key mappings
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)

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
