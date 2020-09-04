set shortmess+=c

set completeopt=noinsert,menuone,noselect

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"""
" completion-nvim stuff
"""
let g:completion_chain_complete_list = {
    \'default' : [
    \    {'complete_items': ['lsp', 'buffer', 'path']},
    \]
    \}
let g:completion_confirm_key = '' " This messes with auto pairs newline binding
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

"""
" nvim-lsp stuff
"""
lua << EOF
  local nvim_lsp = require 'nvim_lsp'
  local configs = require 'nvim_lsp/configs'
  local util = require 'nvim_lsp/util'
  local completion = require 'completion'

  if not configs.sorbet then
      configs.sorbet = {
        default_config = {
          cmd = {'/Users/thanx/.asdf/installs/ruby/2.5.1/lib/ruby/gems/2.5.0/gems/sorbet-static-0.5.5648-universal-darwin-18/libexec/sorbet', 'tc', '--lsp', '--enable-all-experimental-lsp-features', '--disable-watchman'};
          filetypes = {'ruby'};
          root_dir = util.root_pattern('sorbet');
        };
      }
  end

  nvim_lsp.sorbet.setup{
    on_attach = completion.on_attach;
    capabilities = {textDocument = {completion = {completionItem = {snippetSupport = false}}}};
  }

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
