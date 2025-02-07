local M = {}

local function format_buffer(args)
  if not args then
    require("conform").format({ async = true, lsp_format = "fallback" })
  else
    require("conform").format(args)
  end
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

  format_buffer({ async = true, lsp_format = "fallback", range = range })
end

function M.setup()
  local wk = require("which-key")

  local lsp_prefix = "<leader>l"
  local laravel_prefix = "<leader>L"
  local fold_prefix = "<leader>f"

  wk.add({
    {
      mode = "n",
      { lsp_prefix, group = "LSP" },
      { "<leader>L", group = "Laravel" },
      { "<leader>f", group = "Fold" },

      -- LSP
      { lsp_prefix .. "d", vim.lsp.buf.definition, desc = "Go to definition" },
      { lsp_prefix .. "D", vim.lsp.buf.declaration, desc = "Go to declaration" },
      { lsp_prefix .. "i", vim.lsp.buf.implementation, desc = "Go to implementation" },
      { lsp_prefix .. "r", vim.lsp.buf.references, desc = "Show references" },
      { lsp_prefix .. "h", vim.lsp.buf.hover, desc = "Hover" },
      { lsp_prefix .. "s", vim.lsp.buf.signature_help, desc = "Signature help" },
      { lsp_prefix .. "R", vim.lsp.buf.rename, desc = "Rename" },
      { lsp_prefix .. "a", vim.lsp.buf.code_action, desc = "Code action" },
      { lsp_prefix .. "f", format_buffer, desc = "Format" },

      -- Laravel
      { laravel_prefix .. "a", "<cmd>Laravel artisan<cr>", desc = "Laravel Artisan" },
      { laravel_prefix .. "r", "<cmd>Laravel routes<cr>", desc = "Laravel Routes" },
      { laravel_prefix .. "m", "<cmd>Laravel related<cr>", desc = "Laravel Related" },

      -- Folding
      { fold_prefix .. "o", "zo", desc = "Open a fold at the cursor" },
      { fold_prefix .. "c", "zc", desc = "Close a fold at the cursor" },
      { fold_prefix .. "j", "zj", desc = "Move the cursor to the next fold" },
      { fold_prefix .. "k", "zk", desc = "Move the cursor to the prev fold" },
      { fold_prefix .. "O", "zO", desc = "Open all folds" },
      { fold_prefix .. "C", "zM", desc = "Close all folds" },
      { fold_prefix .. "x", "zd", desc = "Delete the fold at the cursor" },
      { fold_prefix .. "X", "zE", desc = "Delete all folds" },
      { fold_prefix .. "[", "[z", desc = "Move to the start of an open fold" },
      { fold_prefix .. "]", "]z", desc = "Move to the end of an open fold" },
    },
    {
      mode = "v",
      { lsp_prefix, group = "LSP" },
      { lsp_prefix .. "f", format_range, desc = "Format selection" },
    },
  })
end

return M
