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

local lazy = require("lazy")

vim.g.mapleader = ","

-- vimwiki
vim.g.vimwiki_list = {
  {
    path = "~/vimwiki/",
    syntax = "markdown",
    ext = "md",
  },
}

lazy.setup({
  "nvim-lualine/lualine.nvim",
  "jiangmiao/auto-pairs",
  "ibhagwan/fzf-lua",
  "machakann/vim-sandwich",
  "tpope/vim-eunuch",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "vimwiki/vimwiki",

  -- Treesitter stuff
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-treesitter/playground",

  -- Autocomplete/lsp stuff
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
    },
    config = function()
      require("lsp")
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },

  {
    "saghen/blink.cmp",

    version = "*",
    opts = {
      keymap = {
        preset = "default",

        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        cmdline = {},

        providers = {
          -- Lsp is slow on mono repo. Buffer is usually good enough.
          lsp = { async = true },
        },
      },

      completion = {
        list = {
          selection = { preselect = false, auto_insert = true },
        },

        menu = {
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind" },
            },
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "nvimtools/none-ls-extras.nvim" },
  },
})

-- Load other config files
require("treesitter")

vim.cmd("filetype plugin on")
vim.cmd("syntax enable")

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = false
vim.o.showmode = false
vim.o.hidden = true

vim.wo.number = true
vim.wo.signcolumn = "yes"
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

-- Use the system clipboard for everything
vim.cmd("set clipboard+=unnamedplus")

vim.g.netrw_liststyle = 3

-- Colors
vim.o.termguicolors = false
vim.cmd.colorscheme("term16")

--
-- Mappings
--

-- Move screen lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("v", "j", "gj")
vim.keymap.set("v", "j", "gj")

-- buffer navigation
vim.keymap.set("n", "<leader>h", ":bn<CR>")
vim.keymap.set("n", "<leader>l", ":bp<CR>")
vim.keymap.set("n", "<leader>j", ":b#<CR>")

vim.keymap.set("n", "<leader>)", ":colorscheme onelight<CR>")
vim.keymap.set("n", "<leader>(", ":colorscheme onedark<CR>")

-- Copy current filename to clipboard
vim.keymap.set("n", "<leader>cf", ":let @* = expand('%')<CR>")

-- Workaround for kines<C-W><C-L>is keyboard. Should probably remap on the hardware
vim.keymap.set("n", "<PageUp>", "<ESC>")
vim.keymap.set("i", "<PageUp>", "<ESC>")
vim.keymap.set("v", "<PageUp>", "<ESC>")
vim.keymap.set("o", "<PageUp>", "<ESC>")
vim.keymap.set("c", "<PageUp>", "<C-c>")

--
-- Plugin settings
--

-- fzf-lua
local fzf = require("fzf-lua")
fzf.setup({
  files = {
    git_icons = false,
  },
  grep = {
    actions = {
      ["ctrl-g"] = false,
      ["alt-g"] = fzf.actions.grep_lgrep,
    },
  },
})
vim.keymap.set("n", "<leader>f", fzf.files)
vim.keymap.set("n", "<leader>b", fzf.buffers)
vim.keymap.set("n", "<leader>/", fzf.live_grep)
vim.keymap.set("n", "<leader>e", fzf.diagnostics_document)
vim.keymap.set("n", "gd", fzf.lsp_definitions)
vim.keymap.set("n", "gD", fzf.lsp_typedefs)
vim.keymap.set("n", "gr", fzf.lsp_references)

-- lualine
require("lualine").setup({
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diagnostics" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
})

-- Fugitive
-- Copy github links to clipboard
vim.keymap.set("n", "<leader>gl", ":.GBrowse!<CR><CR>")
vim.keymap.set("v", "<leader>gl", ":'<,'>Gbrowse!<CR>")
