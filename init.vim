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
function! DoRemote(arg)
    UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Add plugins to &runtimepath
call plug#end()

" Neovim stuff
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

syntax enable
set number

set ignorecase
set smartcase


if has('gui_running')
	set guifont=Source\ Code\ Pro:h14
endif

set laststatus=2

set background=dark
colorscheme solarized

let mapleader = ","

let g:netrw_liststyle=3

" Keybinds
nnoremap <leader>e :Texplore<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
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
noremap <leader>j gt

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

" Neomake
autocmd! BufWritePost * Neomake

