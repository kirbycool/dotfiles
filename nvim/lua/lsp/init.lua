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
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)

-- Diagnostic bindings
vim.keymap.set("n", "<leader>t", vim.diagnostic.open_float)

-- Server setup
lsp.gopls.setup({})
lsp.rust_analyzer.setup({})
lsp.vtsls.setup({
  settings = {
    typescript = {
      tsserver = {
        maxTsServerMemory = 8192,
      },
    },
  },
})
lsp.basedpyright.setup({
  settings = {
    basedpyright = {
      analysis = { typeCheckingMode = "off" },
    },
  },
  on_attach = function(client)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})
lsp.ruff.setup({})

-- Format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
vim.api.nvim_clear_autocmds({ group = augroup })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    vim.lsp.buf.format({
      filter = function(lsp_client)
        return lsp_client.name == "null-ls" or lsp_client.name == "ruff"
      end,
      bufnr = args.bufnr,
    })
  end,
})

require("lsp/null_ls") -- Diagnostics/formatting
require("lsp/sorbet") -- Ruby
