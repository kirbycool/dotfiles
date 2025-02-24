-- Config for null-ls.nvim
local null_ls = require("null-ls")

local builtins = null_ls.builtins

null_ls.setup({
  -- debug = true,
  sources = {
    -- JS/TS
    builtins.formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "jsonc",
        -- "yaml",
        "markdown",
        "markdown.mdx",
        "graphql",
        "handlebars",
      },
    }),
    require("none-ls.diagnostics.eslint"),

    -- Ruby
    builtins.diagnostics.rubocop.with({
      command = "bundle",
      args = vim.list_extend({ "exec", "rubocop" }, builtins.diagnostics.rubocop._opts.args),
      condition = function(utils)
        return utils.root_has_file(".rubocop.yml")
      end,
    }),

    -- Lua
    builtins.diagnostics.selene,
    builtins.formatting.stylua,

    -- Go
    builtins.formatting.gofmt,
  },
})
