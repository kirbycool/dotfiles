local M = {}

M.config = {
  {
    rootMarkers = { "Gemfile" },
    lintCommand = "bundle exec rubocop --format emacs --force-exclusion --stdin ${INPUT}",
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
    lintIgnoreExitCode = true,
  },
}

M.filetypes = {
  "ruby",
}

vim.api.nvim_exec(
  [[
    autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
  ]],
  false
)

return M
