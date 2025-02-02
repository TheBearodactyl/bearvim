local icons = require("bearvim.icons")
local colors = require("bearvim.plugins.config.lualine.colors")
local conditions = require("bearvim.plugins.config.lualine.conditions")

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

--- @param only_supported boolean
local function get_attached_tools(only_supported)
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype
  local tools = {}
  local clients = vim.lsp.get_active_clients({ bufnr = bufnr })

  for _, client in ipairs(clients) do
    if not only_supported or vim.tbl_contains(client.config.filetypes or {}, ft) then
      table.insert(tools, client.name)
    end
  end

  if package.loaded["mason"] then
    local mason_registry = require("mason-registry")
    local mason_tools = mason_registry.get_installed_packages()

    for _, tool in ipairs(mason_tools) do
      if tool.spec.categories and (vim.tbl_contains(tool.spec.categories, "Formatter") or vim.tbl_contains(tool.spec.categories, "Linter")) then
        if not only_supported or (tool.spec.supported_filetypes and vim.tbl_contains(tool.spec.supported_filetypes, ft)) then
          table.insert(tools, tool.name)
        end
      end
    end
  end

  local unique_tools = {}
  local seen = {}
  for _, tool in ipairs(tools) do
    if not seen[tool] then
      table.insert(unique_tools, tool)
      seen[tool] = true
    end
  end

  table.sort(unique_tools)

  return table.concat(unique_tools, ", ")
end

local branch = icons.git.Branch

return {
  mode = {
    function()
      return " " .. icons.ui.Target .. " "
    end,
    padding = { left = 0, right = 0 },
    color = {},
    cond = nil
  },
  branch = {
    "b:gitsigns_head",
    icon = branch,
    color = { gui = "bold" },
  },
  filename = {
    "filename",
    color = {},
    cond = nil
  },
  diff = {
    "diff",
    source = diff_source,
    symbols = {
      added = icons.git.LineAdded .. " ",
      modified = icons.git.LineModified .. " ",
      removed = icons.git.LineRemoved .. " ",
    },
    padding = { left = 2, right = 1 },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.yellow },
      removed = { fg = colors.red }
    },
    cond = nil,
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = {
      error = icons.diagnostics.BoldError .. " ",
      warn = icons.diagnostics.BoldWarning .. " ",
      info = icons.diagnostics.BoldInformation .. " ",
      hint = icons.diagnostics.BoldHint .. " ",
    },
  },
  treesitter = {
    function()
      return icons.ui.Tree
    end,
    color = function()
      local buf = vim.api.nvim_get_current_buf()
      local ts = vim.treesitter.highlighter.active[buf]

      return { fg = ts and not vim.tbl_isempty(ts) and colors.green or colors.red }
    end,
    cond = conditions.hide_in_width,
  },
  lsp = {
    function()
      local buf_clients = vim.lsp.get_clients { bufnr = 0 }
      if #buf_clients == 0 then
        return "LSP Inactive"
      end

      return "[" .. get_attached_tools(true) .. "]"
    end,
    color = { gui = "bold" },
    cond = conditions.hide_in_width
  },
  location = { "location" },
  progress = {
    "progress",
    fmt = function()
      return "%P/%L"
    end,
    color = {},
  },
  spaces = {
    function()
      local shiftwidth = vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
      return icons.ui.Tab .. " " .. shiftwidth
    end,
    padding = 1,
  },
  encoding = {
    "o:encoding",
    fmt = string.upper,
    color = {},
    cond = conditions.hide_in_width,
  },
  filetype = { "filetype", cond = nil, padding = { left = 1, right = 1 } },
  scrollbar = {
    function()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index]
    end,
    padding = { left = 0, right = 0 },
    color = "$LProgress",
    cond = nil
  }
}
