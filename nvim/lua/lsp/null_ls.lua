-- Config for null-ls.nvim
local null_ls = require("null-ls")

local builtins = null_ls.builtins

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(lsp_client)
							return lsp_client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
