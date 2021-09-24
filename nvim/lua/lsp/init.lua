local lsp = require('lspconfig')
local utils = require('utils')
local noremap = utils.noremap

-- Ruby
require('lsp/sorbet')

-- JS/TS
require('lsp/tsserver')
require('lsp/efm')

lsp.gopls.setup{}
lsp.rust_analyzer.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
    signs = true,
    underline = true,
  }
)


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
