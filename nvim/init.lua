vim.cmd("packadd packer.nvim")
local packer = require("packer")
local utils = require("utils")
local noremap = utils.noremap

packer.startup(function()
	use("wbthomason/packer.nvim")

	use("editorconfig/editorconfig-vim")
	use("itchyny/lightline.vim")
	use("jiangmiao/auto-pairs")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use("kirbycool/one-colors.vim")
	use("machakann/vim-sandwich")
	use("junegunn/goyo.vim")
	use("tpope/vim-eunuch")
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use("vimwiki/vimwiki")

	-- Treesitter stuff
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/playground")

	-- Autocomplete/lsp stuff
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})
end)

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
vim.cmd("colorscheme onedark")

--
-- Mappings
--
vim.g.mapleader = ","

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

noremap("n", "<leader>e", ":Texplore<CR>")

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

-- diagnostics
noremap("n", "<leader>t", ":lopen<CR>")
noremap("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>")

--
-- Plugin settings
--

-- Telescope
require("telescope").load_extension("ui-select")
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", telescope_builtin.find_files)
vim.keymap.set("n", "<leader>b", function()
	telescope_builtin.buffers({ ignore_current_buffer = true, sort_mru = true })
end)
vim.keymap.set("n", "<leader>/", telescope_builtin.live_grep)

-- ALE
-- vim.g.ale_fix_on_save = 1

-- lightline
vim.g.lightline = {
	enable = {
		statusline = 1,
		tabline = 0,
	},
	colorscheme = "one",
	active = {
		left = {
			{ "mode", "paste" },
			{ "gitbranch", "readonly", "relativepath", "modified" },
		},
		right = {
			{ "lineinfo" },
			{ "percent" },
		},
	},
	component = {
		filename = "%t",
		relativepath = "%f",
	},
	component_function = {
		gitbranch = "fugitive#head",
	},
}

-- Fugitive
-- Copy gitub links to clipboard
noremap("n", "<leader>gl", ":.GBrowse!<CR><CR>")
noremap("v", "<leader>gl", ":'<,'>Gbrowse!<CR>")

-- vimwiki
vim.g.vimwiki_list = {
	{
		path = "~/vimwiki",
		syntax = "markdown",
		ext = "md",
	},
}
