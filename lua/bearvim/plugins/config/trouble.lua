local M = {}

function M.setup()
  require("trouble").setup({
    modes = {
      diags = {
        mode = "diagnostics",
        filter = {
          any = {
            buf = 0,
            {
              severity = vim.diagnostic.severity.ERROR,
              function(item)
                return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
              end,
            },
          },
        },
      },
      cascade = {
        mode = "diagnostics",
        filter = function(items)
          local severity = vim.diagnostic.severity.HINT
          for _, item in ipairs(items) do
            severity = math.min(severity, item.severity)
          end

          return vim.tbl_filter(function(item)
            return item.severity == severity
          end, items)
        end,
      },
      preview_float = {
        mode = "diagnostics",
        preview = {
          type = "float",
          relative = "editor",
          border = "rounded",
          title = "Preview",
          title_pos = "center",
          position = { 0, -2 },
          size = { width = 0.25, height = 0.25 },
          zindex = 200,
        },
      },
    },
  })
end

return M
