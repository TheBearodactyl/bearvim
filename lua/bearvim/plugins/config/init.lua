local M = {}

-- LSP
require("bearvim.plugins.config.lsp").setup()

-- Diagnostics
require("bearvim.plugins.config.diagnostics").setup()

-- Snippets
require("bearvim.plugins.config.snippets").setup()

-- Treesitter
require("bearvim.plugins.config.treesitter").setup()

-- Indent Markers
require("bearvim.plugins.config.indent").setup()

-- Custom Formatter Configs
require("bearvim.plugins.config.conform").setup()

-- KeyMaps
require("bearvim.plugins.config.which-key").setup()

-- Completion
require("bearvim.plugins.config.completion").setup()

-- LuaLine
require("bearvim.plugins.config.lualine").setup()

-- Git
require("bearvim.plugins.config.git").setup()

return M
