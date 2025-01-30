local M = {}

function M.safe_call(func, ...)
	local status, result = pcall(func, ...)

	if not status then
		vim.notify("Error: " .. result, vim.log.levels.ERROR)
	end

	return result
end

function M.notify_error(msg)
	vim.notify(msg, vim.log.levels.ERROR)
end

return M
