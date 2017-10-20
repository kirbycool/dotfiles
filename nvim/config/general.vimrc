" Neovim stuff
let g:python_host_prog = '/Users/kcool/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/kcool/.pyenv/versions/neovim3/bin/python'

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

let g:netrw_liststyle=3

" Close omni completion help window on completion done
autocmd CompleteDone * pclose
