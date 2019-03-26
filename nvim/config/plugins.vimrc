"""
" This is plugin settings. Plugin list is in init.vimrc
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
nnoremap <Leader>F :ALEFix<CR>

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
      \     'relative_path': 'LightlineRelativePath',
      \ }
\ }

function! LightlineRelativePath()
  return expand('%')
endfunction
