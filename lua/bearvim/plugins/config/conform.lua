local M = {}

function M.setup()
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black", "isort" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      markdown = { "prettier" },
      yaml = { "prettier" },
      sh = { "shfmt" },
      rs = { "leptosfmt" },
    },

    formatters = {
      shfmt = {
        command = "shfmt",
        args = { "-i", "2", "-bn", "-ci", "-sr" },
      },
    },

    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  })
end

return M
