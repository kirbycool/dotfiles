set shortmess+=c

"""
" NCM completion behavior
"""
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
let g:float_preview#docked = 0
let g:ncm2#complete_length = 1

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"""
" nvim-lsp stuff
"""
lua << EOF
  local nvim_lsp = require('nvim_lsp')
  local ncm2 = require('ncm2')

  nvim_lsp.tsserver.setup{on_init = ncm2.register_lsp_source}
  nvim_lsp.flow.setup{on_init = ncm2.register_lsp_source}


  -- Let ALE handle diagnostics for now
  do
    vim.lsp.callbacks['textDocument/publishDiagnostics'] = nil
  end
EOF

" Example bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
