local M = {}

local function format_buffer()
  require("conform").format({ async = true, lsp_format = "fallback" })
end

local function format_range()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  local end_line_text = vim.api.nvim_buf_get_lines(0, end_line - 1, end_line, true)[1]
  local end_col = end_line_text:len()

  local range = {
    start = { start_line, 0 },
    ["end"] = { end_line, end_col },
  }

  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end

function M.setup()
  local wk = require("which-key")

  wk.add({
    {
      mode = "n",
      { "<leader>l", group = "LSP" },
      { "<leader>L", group = "Laravel" },

      { "<leader>ld", vim.lsp.buf.definition, desc = "Go to definition" },
      { "<leader>lD", vim.lsp.buf.declaration, desc = "Go to declaration" },
      { "<leader>li", vim.lsp.buf.implementation, desc = "Go to implementation" },
      { "<leader>lr", vim.lsp.buf.references, desc = "Show references" },
      { "<leader>lh", vim.lsp.buf.hover, desc = "Hover" },
      { "<leader>ls", vim.lsp.buf.signature_help, desc = "Signature help" },
      { "<leader>lR", vim.lsp.buf.rename, desc = "Rename" },
      { "<leader>la", vim.lsp.buf.code_action, desc = "Code action" },
      { "<leader>lf", format_buffer, desc = "Format" },

      { "<leader>La", "<cmd>Laravel artisan<cr>", desc = "Laravel Artisan" },
      { "<leader>Lr", "<cmd>Laravel routes<cr>", desc = "Laravel Routes" },
      { "<leader>Lm", "<cmd>Laravel related<cr>", desc = "Laravel Related" },
    },
    {
      mode = "v",
      { "<leader>l", group = "LSP" },
      { "<leader>lf", format_range, desc = "Format selection" },
    },
  })
end

return M
