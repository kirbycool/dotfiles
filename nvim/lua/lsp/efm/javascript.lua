local M = {}

M.config = {
  {
    rootMarkers = { "package.json" },
    lintCommand = "./node_modeuls/.bin/eslint -f unix --stdin --stdin-filename {INPUT}",
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
    lintIgnoreExitCode = true,
  },
  {
    rootMarkers = { "package.json" },
    formatCommand = "./node_modules/.bin/prettier",
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

return M
