require('lspconfig').tsserver.setup {
  init_options = { documentFormatting = false, codeAction = true },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
}
