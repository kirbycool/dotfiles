call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'hynek/vim-python-pep8-indent'
Plug 'jelera/vim-javascript-syntax'
Plug 'mileszs/ack.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'pangloss/vim-javascript'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'zchee/deoplete-jedi'

" Add plugins to &runtimepath
call plug#end()
