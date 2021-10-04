DATA_PATH = vim.fn.stdpath("data")

vim.cmd('packadd paq-nvim')
local paq = require('paq-nvim').paq
local utils = require('utils')
local noremap = utils.noremap

paq{'savq/paq-nvim', opt=true}

paq('editorconfig/editorconfig-vim')
paq('itchyny/lightline.vim')
paq('jiangmiao/auto-pairs')
paq(
  'junegunn/fzf',
  { hook = function() vim.api.nvim_exec('fzf#install()') end }
)
paq('junegunn/fzf.vim')
paq('kirbycool/one-colors.vim')
paq('machakann/vim-sandwich')
paq('nvim-treesitter/nvim-treesitter')
paq('junegunn/goyo.vim')
paq('tpope/vim-eunuch')
paq('tpope/vim-fugitive')
paq('tpope/vim-rhubarb')
paq('vimwiki/vimwiki')

-- Autocomplete/lsp stuff
paq('neovim/nvim-lspconfig')
paq('kabouzeid/nvim-lspinstall')
paq('hrsh7th/nvim-compe')
paq('folke/trouble.nvim')

-- Load other config files
require('completion')
require('lsp')
require('treesitter')


vim.cmd('filetype plugin on')
vim.cmd('syntax enable')

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = false
vim.o.showmode = false
vim.o.hidden = true

vim.wo.number = true
vim.wo.signcolumn = 'yes'
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- Use the system clipboard for everything
vim.cmd('set clipboard+=unnamedplus')

vim.g.netrw_liststyle = 3

-- Colors
vim.o.termguicolors = true
vim.cmd('colorscheme onedark')

--
-- Mappings
--
vim.g.mapleader = ','

-- Move screen lines
noremap('n', 'j', 'gj')
noremap('n', 'k', 'gk')
noremap('v', 'j', 'gj')
noremap('v', 'j', 'gj')

-- buffer navigation
noremap('n', '<leader>h', ':bn<CR>')
noremap('n', '<leader>l', ':bp<CR>')
noremap('n', '<leader>j', ':b#<CR>')

-- Switch splits
noremap('n', '<leader><S-J>', '<C-W><C-J>')
noremap('n', '<leader><S-K>', '<C-W><C-K>')
noremap('n', '<leader><S-L>', '<C-W><C-L>')
noremap('n', '<leader><S-H>', '<C-W><C-H>')

noremap('n', '<leader>e', ':Texplore<CR>')

noremap('n', '<leader>)', ':colorscheme onelight<CR>')
noremap('n', '<leader>(', ':colorscheme onedark<CR>')


-- Copy current filename to clipboard
noremap('n', '<leader>cf', ":let @* = expand('%')<CR>")

-- Workaround for kines<C-W><C-L>is keyboard. Should probably remap on the hardware
noremap('n', '<PageUp>', '<ESC>')
noremap('i', '<PageUp>', '<ESC>')
noremap('v', '<PageUp>', '<ESC>')
noremap('o', '<PageUp>', '<ESC>')
noremap('c', '<PageUp>', '<C-c>')

--
-- Plugin settings
--

-- fzf
vim.g.fzf_preview_window = ''
noremap('n', '<leader>f', ':Files<CR>')
noremap('n', '<leader>b', ':Buffers<CR>')
noremap('n', '<leader>/', ':Rg<Space>', { noremap = true })

-- ALE
-- vim.g.ale_fix_on_save = 1

-- lightline
vim.g.lightline = {
  enable = {
    statusline = 1,
    tabline = 0
  },
  colorscheme = 'one',
  active = {
    left = {
      {'mode', 'paste'},
      {'gitbranch', 'readonly', 'relativepath', 'modified'}
    },
    right = {
      {'lineinfo'},
      {'percent'}
    }
  },
  component = {
    filename = '%t',
    relativepath = '%f'
  },
  component_function = {
    gitbranch = 'fugitive#head',
  },
}

-- Fugitive
-- Copy gitub links to clipboard
noremap('n', '<leader>gl', ':.Gbrowse!<CR><CR>')
noremap('v', '<leader>gl', ":'<,'>Gbrowse!<CR>")

-- vimwiki
vim.g.vimwiki_list = {
  {
    path = '~/vimwiki',
    syntax = 'markdown',
    ext = 'md'
  }
}

-- trouble.nvim
require("trouble").setup {
  icons = false,
  use_lsp_diagnostic_signs = true
}

noremap('n', '<leader>t', ':Trouble<CR>')
