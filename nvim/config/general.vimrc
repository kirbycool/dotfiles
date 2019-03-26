" Neovim stuff
let g:python_host_prog = $HOME . '/.asdf/installs/python/2.7.15/bin/python'
let g:python3_host_prog = $HOME . '/.asdf/installs/python/3.7.2/bin/python'

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

" Autocomplete
inoremap <silent><expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
