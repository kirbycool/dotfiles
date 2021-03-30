local lsp = require('lspconfig')
local utils = require('utils')
local noremap = utils.noremap

if not lsp.sorbet then
    lsp.configs.sorbet = {
      default_config = {
        cmd = {'/Users/thanx/.asdf/installs/ruby/2.5.1/lib/ruby/gems/2.5.0/gems/sorbet-static-0.5.5648-universal-darwin-18/libexec/sorbet', 'tc', '--lsp', '--enable-all-experimental-lsp-features', '--disable-watchman'};
        filetypes = {'ruby'};
        root_dir = lsp.util.root_pattern('sorbet');
      };
    }
end

lsp.sorbet.setup{}
lsp.gopls.setup{}
lsp.rust_analyzer.setup{}
lsp.tsserver.setup{}

-- Let ALE handle diagnostics for now
do
  vim.lsp.handlers['textDocument/publishDiagnostics'] = function() end
end

-- LSP Bindings
noremap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
noremap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
noremap('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
noremap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
noremap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
noremap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
noremap('n', '<leader>td', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
noremap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
noremap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
