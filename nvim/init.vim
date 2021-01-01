call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kirbycool/one-colors.vim'
Plug 'machakann/vim-sandwich'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vimwiki/vimwiki'

" Autocomplete/lsp stuffs
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'

call plug#end()

runtime completion.vim

"""
" General Settings
"""
filetype plugin on

syntax enable
set number

" Treesitter folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

set ignorecase
set smartcase
set nohlsearch
set noincsearch
set noshowmode
set completeopt-=preview


"""
" Colors
"""
set termguicolors
colorscheme onedark
highlight SignColumn ctermbg=black

let g:netrw_liststyle=3

"""
" Bindings
"""
let mapleader = ","

" Move screen lines instead of buffer lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

inoremap <PageUp> <ESC>
nnoremap <PageUp> <ESC>
vnoremap <PageUp> <ESC>
onoremap <PageUp> <ESC>
cnoremap <PageUp> <C-c>

nnoremap <leader>e :Texplore<CR>
nnoremap <leader><S-J> <C-W><C-J>
nnoremap <leader><S-K> <C-W><C-K>
nnoremap <leader><S-L> <C-W><C-L>
nnoremap <leader><S-H> <C-W><C-H>

nnoremap <leader>) :colorscheme onelight<CR>
nnoremap <leader>( :colorscheme onedark<CR>

set clipboard+=unnamedplus
" Copy filename to clipboard
nnoremap <leader>cf :let @* = expand('%')<CR>

" Buffer/tab nav
map <Leader>j :b#<Return>
map <Leader>q :bd<Return>
map <Leader>h :tabp<Return>
map <Leader>l :tabn<Return>

"""
" Plugin settings
"""

" fzf
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <leader>/ :Rg<Space>
let g:fzf_preview_window = ''

" ALE
hi ALESignColumnWithoutErrors ctermbg=black
hi ALESignColumnWithErrors ctermbg=darkgrey
let g:ale_sign_column_always = 1
let g:ale_change_sign_column_color = 1
let g:ale_fix_on_save = 1

" lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \     'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'relative_path', 'modified']],
      \     'right': [['lineinfo'], ['percent']]
      \ },
      \ 'component_function': {
      \     'gitbranch': 'fugitive#head',
      \     'relative_path': 'LightlineRelativePath'
      \ },
\ }

function! LightlineRelativePath()
  return expand('%')
endfunction

" Fugitive
" copy github links to clipboard
nnoremap <leader>gl :.Gbrowse!<CR><CR>
vnoremap <leader>gl :'<,'>Gbrowse!<CR>

" Treesitter
lua <<EOF
  require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    indent = {
      enable = true,
    },
  }
EOF

" vimwiki
let g:vimwiki_list = [
\ {
\   'path': '~/vimwiki/',
\   'syntax': 'markdown',
\   'ext': 'md'
\ }
\]
