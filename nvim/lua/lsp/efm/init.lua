local js = require('lsp/efm/javascript')
local ruby = require('lsp/efm/ruby')

require('lspconfig').efm.setup {
  -- init_options = {initializationOptions},
  cmd = { DATA_PATH .. "/lspinstall/efm/efm-langserver" },
  init_options = { documentFormatting = true, codeAction = false },
  filetypes = {
    unpack(js.filetypes),
    unpack(ruby.filetypes),
  },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      vue = js.config,
      javascript = js.config,
      javascriptreact = js.config,
      ["javascript.jsx"] = js.config,
      typescript = js.config,
      ["typescript.tsx"] = js.config,
      typescriptreact = js.config,

      ruby = ruby.config,
    },
  },
}
