local lspconfig = require("lspconfig")

local handle = io.popen("bundle show sorbet-static")
local sorbetPath = string.gsub(handle:read("*all"), "\n", "") .. "/libexec/sorbet"
handle:close()

lspconfig.sorbet.setup({
	cmd = { sorbetPath, "tc", "--lsp", "--enable-all-experimental-lsp-features", "--disable-watchman" },
	root_dir = lspconfig.util.root_pattern("sorbet/*", "sorbet/**/*"),
	init_options = { documentFormatting = false, codeAction = true },
})
