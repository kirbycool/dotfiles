-- Config for null-ls.nvim
local null_ls = require("null-ls")

local builtins = null_ls.builtins

null_ls.setup({
	sources = {
		-- JS/TS
		builtins.formatting.prettier,
		builtins.diagnostics.eslint,

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
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
        augroup END
      ]])
		end
	end,
})
