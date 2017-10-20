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
nnoremap <leader>t <c-t>
nnoremap <leader><s-]> <c-w><c-]><c-w>T

" generate ctags
noremap <leader>gt !ctags -R --exclude=@.ctagsignore --languages=python ./
