call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Konfekt/FastFold'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
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
