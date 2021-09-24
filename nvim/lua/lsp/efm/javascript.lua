local M = {}

M.config = {
  {
    rootMarkers = { "package.json" },
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
    lintIgnoreExitCode = true,
  },
  {
    rootMarkers = { "package.json" },
    formatCommand = "./node_modules/.bin/prettier --stdin --stdin-filepath ${INPUT}",
    formatStdin = true,
  },
}

M.filetypes = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "javascript.jsx",
  "typescript.tsx",
}

vim.api.nvim_exec(
  [[
    autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
  ]],
  false
)

return M
