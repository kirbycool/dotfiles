call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
\ }
Plug 'altercation/vim-colors-solarized'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'fgrsnau/ncm2-otherbuf', { 'branch': 'ncm2' }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Konfekt/FastFold'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'noprompt/vim-yardoc'
Plug 'pangloss/vim-javascript'
Plug 'roxma/nvim-yarp'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale', { 'tag': 'v2.*' }


" Add plugins to &runtimepath
call plug#end()
