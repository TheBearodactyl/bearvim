local M = {}

--- @param ft string The filetype
function M.not_ft(ft)
  return vim.bo.filetype ~= ft
end

return M
