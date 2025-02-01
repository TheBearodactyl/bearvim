local M = {}

function M.set_keymap(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

function M.del_keymap(mode, lhs)
  vim.keymap.del(mode, lhs)
end

function M.get_keymap(mode, lhs)
  return vim.fn.maparg(lhs, mode)
end

return M
