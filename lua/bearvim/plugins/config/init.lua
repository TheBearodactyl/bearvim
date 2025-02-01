local M = {}

-- LSP
require("bearvim.plugins.config.lsp").setup()
require("bearvim.plugins.config.diagnostics").setup()

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

return M
