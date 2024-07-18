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
local utils = require("utils")
local noremap = utils.noremap

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
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"nvim-telescope/telescope-ui-select.nvim",
	"kirbycool/one-colors.vim",
	"machakann/vim-sandwich",
	"junegunn/goyo.vim",
	"tpope/vim-eunuch",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"vimwiki/vimwiki",

	-- Treesitter stuff
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/playground",

	-- Autocomplete/lsp stuff
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/vim-vsnip",
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},
})

-- Load other config files
require("completion")
require("lsp")
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
vim.o.termguicolors = true
vim.cmd("colorscheme onelight")

--
-- Mappings
--

-- Move screen lines
noremap("n", "j", "gj")
noremap("n", "k", "gk")
noremap("v", "j", "gj")
noremap("v", "j", "gj")

-- buffer navigation
noremap("n", "<leader>h", ":bn<CR>")
noremap("n", "<leader>l", ":bp<CR>")
noremap("n", "<leader>j", ":b#<CR>")

-- Switch splits
noremap("n", "<leader><S-J>", "<C-W><C-J>")
noremap("n", "<leader><S-K>", "<C-W><C-K>")
noremap("n", "<leader><S-L>", "<C-W><C-L>")
noremap("n", "<leader><S-H>", "<C-W><C-H>")

noremap("n", "<leader>)", ":colorscheme onelight<CR>")
noremap("n", "<leader>(", ":colorscheme onedark<CR>")

-- Copy current filename to clipboard
noremap("n", "<leader>cf", ":let @* = expand('%')<CR>")

-- Workaround for kines<C-W><C-L>is keyboard. Should probably remap on the hardware
noremap("n", "<PageUp>", "<ESC>")
noremap("i", "<PageUp>", "<ESC>")
noremap("v", "<PageUp>", "<ESC>")
noremap("o", "<PageUp>", "<ESC>")
noremap("c", "<PageUp>", "<C-c>")

--
-- Plugin settings
--

-- Telescope
local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
local telescope_actions = require("telescope.actions")

telescope.load_extension("ui-select")
telescope.setup({
	defaults = {
		path_display = { shorten = { len = 5 } },
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
		mappings = {
			i = {
				["<Down>"] = telescope_actions.cycle_history_next,
				["<Up>"] = telescope_actions.cycle_history_prev,
			},
		},
	},
})

vim.keymap.set("n", "<leader>f", function()
	telescope_builtin.find_files({ hidden = true })
end)
vim.keymap.set("n", "<leader>b", function()
	telescope_builtin.buffers({ ignore_current_buffer = true, sort_mru = true })
end)
vim.keymap.set("n", "<leader>/", telescope_builtin.live_grep)
vim.keymap.set("n", "<leader>e", function()
	telescope_builtin.diagnostics({ bufnr = 0 })
end)

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
-- Copy gitub links to clipboard
noremap("n", "<leader>gl", ":.GBrowse!<CR><CR>")
noremap("v", "<leader>gl", ":'<,'>Gbrowse!<CR>")
