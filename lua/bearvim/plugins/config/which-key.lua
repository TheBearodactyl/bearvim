local M = {}

function M.setup()
  local wk = require("which-key")

  wk.add({
    {
      mode = "n",
      { "<leader>l", group = "LSP" },
      { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
    },
  })
end

return M
