local M = {}

function M.noremap(mode, lhs, rhs, opts)
	if opts == nil then
		opts = { noremap = true, silent = true }
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

return M
