local lsp = require("lspconfig")
local utils = require("utils")
local noremap = utils.noremap
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server) server:setup{} end)

-- Diagnostic settings
vim.api.nvim_exec(
	[[
    autocmd DiagnosticChanged * lua vim.diagnostic.setloclist({open = false })
  ]],
	false
)
vim.api.nvim_exec(
	[[
    autocmd BufEnter * lua vim.diagnostic.setloclist({open = false })
  ]],
	false
)

-- LSP Bindings
noremap("n", "gD", "<Cmd>lua require('fzf-lua').lsp_declarations()<CR>")
noremap("n", "gd", "<Cmd>lua require('fzf-lua').lsp_definitions()<CR>")
noremap("n", "ga", "<Cmd>lua require('fzf-lua').lsp_code_actions()<CR>")
noremap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
noremap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
noremap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
noremap("n", "<leader>td", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
noremap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
noremap("n", "gr", "<cmd>lua require('fzf-lua').lsp_references()<CR>")


lsp.gopls.setup({})
lsp.rust_analyzer.setup({})

require("lsp/null_ls") -- Diagnostics/formatting
require("lsp/sorbet") -- Ruby
require("lsp/tsserver") -- JS/TS
