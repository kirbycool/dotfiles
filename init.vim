call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'Yggdroot/indentLine'
Plug 'ternjs/tern_for_vim'
Plug 'zchee/deoplete-jedi'
Plug 'benekastah/neomake'
Plug 'tpope/vim-fugitive'
Plug 'ternjs/tern_for_vim'
Plug 'hynek/vim-python-pep8-indent'
function! DoRemote(arg)
    UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'tmhedberg/SimpylFold'

" Add plugins to &runtimepath
call plug#end()

" Neovim stuff
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

syntax enable
set number

set ignorecase
set smartcase
set nohlsearch
set noincsearch


if has('gui_running')
	set guifont=Source\ Code\ Pro\ for\ Powerline:h14
endif

set laststatus=2

set background=dark
colorscheme solarized

let mapleader = ","

let g:netrw_liststyle=3

" Close omni completion help window on completion done
autocmd CompleteDone * pclose

"""""
" Keybinds
"""""
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
nnoremap <leader>t <c-t>
nnoremap <leader><s-]> <c-w><c-]><c-w>T

" generate ctags
noremap <leader>gt !ctags -R --exclude=@.ctagsignore --languages=python ./

" Airline
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1

" CtrlP bindings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
"inoremap <silent><expr><s-tab> pumvisible() ? "\<C-p>" : deoplete#manual_complete()

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

" Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_maker = {
    \   'args': ['--filename=*'],
    \ }
autocmd! BufWritePost * Neomake

set clipboard+=unnamedplus
