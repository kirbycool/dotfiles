call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kirbycool/one-colors.vim'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-sandwich'
Plug 'w0rp/ale'

" graphql
Plug 'jparise/vim-graphql'

" nginx
Plug 'chr4/nginx.vim'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()

"""
" General Settings
"""
" Neovim stuff
let g:python_host_prog = trim(system('asdf which python2'))
let g:python3_host_prog = trim(system('asdf which python3'))

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
map <Leader>) :let &background = ( &background == "dark"? "light" : "dark" )<CR> " Toggle background

set clipboard+=unnamedplus
" Copy filename to clipboard
nnoremap <leader>cf :let @* = expand('%')<CR>

" Buffer nav
map <Leader>j :b#<Return>
map <Leader>q :bd<Return>

" Go to tab
noremap <leader>h gT
noremap <leader>l gt

" Autocomplete
inoremap <silent><expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

"""
" Plugin settings
"""

" fzf
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" vim-json
let g:vim_json_syntax_conceal = 0

" Ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <leader>/ :Ack!<Space>

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

" coc
nnoremap gd <Plug>(coc-definition)
nnoremap gr <Plug>(coc-references)
nnoremap K :call CocAction("doHover")<CR>

" Treesitter
lua <<EOF
  require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
  }
EOF
