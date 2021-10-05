-- Config for null-ls.nvim
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")

local builtins = null_ls.builtins

null_ls.config({
	sources = {
		-- JS/TS
		builtins.formatting.prettier.with({ command = "./node_modules/.bin/prettier" }),
		builtins.diagnostics.eslint.with({ command = "./node_modules/.bin/eslint" }),

		-- Ruby
		builtins.diagnostics.rubocop,

		-- Lua
		builtins.diagnostics.selene,
		builtins.formatting.stylua,
	},
})

lspconfig["null-ls"].setup({})

vim.api.nvim_exec(
	[[
    autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
  ]],
	false
)
