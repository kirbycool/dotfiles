-- Config for null-ls.nvim
local null_ls = require("null-ls")

local builtins = null_ls.builtins

null_ls.setup({
	sources = {
		-- JS/TS
		builtins.formatting.prettier.with({ command = "./node_modules/.bin/prettier" }),
		builtins.diagnostics.eslint.with({ command = "./node_modules/.bin/eslint" }),

		-- Ruby
		builtins.diagnostics.rubocop.with({
			command = "bundle",
			args = { "exec", "rubocop", "-f", "json", "--stdin", "$FILENAME" },
      condition = function(utils)
        return utils.root_has_file('.rubocop.yml')
      end
		}),

		-- Lua
		builtins.diagnostics.selene,
		builtins.formatting.stylua,
	},
})

vim.api.nvim_exec(
	[[
    autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
  ]],
	false
)
