local compe = require('compe')
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local util = require('lspconfig/util')

local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

vim.cmd [[set shortmess+=c]]

vim.o.completeopt = 'noinsert,menuone,noselect'

vim.api.nvim_exec(
  -- Use enter to select and start a new line rather than just select
  -- Navigate the completion menu with tab and s-tab
  [[
    inoremap <expr> <CR> pumvisible() ? "\<c-y>\<cr>" : "\<CR>"
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  ]],
  true
)

compe.setup {
  enabled = true;
  autocomplete = true;
  min_length = 1;
  preselect = 'enable';
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

-- LSP Config
if not lspconfig.sorbet then
    configs.sorbet = {
      default_config = {
        cmd = {'/Users/thanx/.asdf/installs/ruby/2.5.1/lib/ruby/gems/2.5.0/gems/sorbet-static-0.5.5648-universal-darwin-18/libexec/sorbet', 'tc', '--lsp', '--enable-all-experimental-lsp-features', '--disable-watchman'};
        filetypes = {'ruby'};
        root_dir = util.root_pattern('sorbet');
      };
    }
end

lspconfig.sorbet.setup{}
lspconfig.gopls.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.tsserver.setup{}

-- Let ALE handle diagnostics for now
do
  vim.lsp.callbacks['textDocument/publishDiagnostics'] = nil
end

-- LSP Bindings
local opts = { noremap=true, silent=true }
buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
buf_set_keymap('n', '<leader>td', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
