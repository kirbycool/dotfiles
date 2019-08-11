call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Konfekt/FastFold'
Plug 'leafgarland/typescript-vim'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'noprompt/vim-yardoc'
Plug 'pangloss/vim-javascript'
Plug 'roxma/nvim-yarp'
Plug 'Shougo/echodoc.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'

" Add plugins to &runtimepath
call plug#end()

"""
" General Settings
"""
" Neovim stuff
let g:python_host_prog = $ASDF_ROOT . '/installs/python/2.7.15/bin/python'
let g:python3_host_prog = $ASDF_ROOT . '/installs/python/3.7.2/bin/python'

filetype plugin on

syntax enable
set number

set foldmethod=syntax

set ignorecase
set smartcase
set nohlsearch
set noincsearch
set noshowmode
set completeopt-=preview

if has('gui_running')
   set guifont=Source\ Code\ Pro\ for\ Powerline:h14
endif

set background=dark
colorscheme solarized

highligh SignColumn ctermbg=black

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
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR> " Toggle background

set clipboard+=unnamedplus

" Buffer nav
map <Leader>a :bprev<Return>
map <Leader>s :bnext<Return>
map <Leader>d :bd<Return>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
noremap <leader>h gT
noremap <leader>l gt

" tag
nnoremap <leader>] <c-]>
nnoremap <leader>[ <c-t>
nnoremap <leader><s-]> <c-w><c-]><c-w>T

" generate ctags
noremap <leader>gt !ctags -R --exclude=@.ctagsignore --languages=python ./

" Autocomplete
inoremap <silent><expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

"""
" Plugin settings
"""

" fzf
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>t :Tags<CR>

" vim-json
let g:vim_json_syntax_conceal = 0

" Ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <leader>/ :Ack!<Space>

" fugitive
nnoremap <leader>b :Gblame<CR>

" Easy Align
xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

" ALE
hi ALESignColumnWithoutErrors ctermbg=black
hi ALESignColumnWithErrors ctermbg=darkgrey
let g:ale_sign_column_always = 1
let g:ale_change_sign_column_color = 1
let g:ale_fix_on_save = 1

" vim-javascript
let g:javascript_plugin_flow = 1

" lightline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \     'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'relative_path', 'modified']],
      \     'right': [['lineinfo'], ['percent']]
      \ },
      \ 'component_function': {
      \     'gitbranch': 'fugitive#head',
      \     'relative_path': 'LightlineRelativePath'
      \ }
\ }

function! LightlineRelativePath()
  return expand('%')
endfunction
