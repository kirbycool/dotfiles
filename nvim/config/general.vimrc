" Neovim stuff
let g:python_host_prog = $PYENV_ROOT . '/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'

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
