local lsp = require("lspconfig")
local mason = require("mason")

mason.setup()

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
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions)
vim.keymap.set("n", "gD", telescope_builtin.lsp_type_definitions)
vim.keymap.set("n", "gr", telescope_builtin.lsp_references)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)

-- Diagnostic bindings
vim.keymap.set("n", "<leader>t", vim.diagnostic.open_float)

-- Server setup
lsp.gopls.setup({})
lsp.rust_analyzer.setup({})
lsp.vtsls.setup({})
lsp.basedpyright.setup({
  on_attach = function(client)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

require("lsp/null_ls") -- Diagnostics/formatting
require("lsp/sorbet") -- Ruby
