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
vim.lsp.enable("gopls")
vim.lsp.enable("rust_analyzer")

vim.lsp.config["vtsls"] = {
  settings = {
    typescript = {
      tsserver = {
        maxTsServerMemory = 8192,
      },
    },
  },
}
vim.lsp.enable("vtsls")

-- tsgo is way faster but not quite ready. No import actions, slow/broken ast updates
-- vim.lsp.config["tsgo"] = {
--   cmd = { "tsgo", "--lsp", "--stdio" },
--   filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
--   root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },
-- }
-- vim.lsp.enable("tsgo")

-- lsp.basedpyright.setup({
--   settings = {
--     basedpyright = {
--       analysis = { typeCheckingMode = "off" },
--     },
--   },
--   on_attach = function(client)
--     client.server_capabilities.semanticTokensProvider = nil
--   end,
-- })
vim.lsp.enable("pyrefly")
vim.lsp.enable("ruff")

-- lsp.elixirls.setup({})

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
