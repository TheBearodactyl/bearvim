local M = {}

function M.create_autocmd(event, opts)
	vim.api.nvim_create_autocmd(event, opts)
end

function M.delete_autocmd(id)
	vim.api.nvim_del_autocmd(id)
end

function M.clear_autocmds(group_name)
	vim.api.nvim_clear_autocmds({ group = group_name })
end

return M
