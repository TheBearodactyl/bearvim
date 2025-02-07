local M = {}

-- LSP
require("bearvim.plugins.config.lsp").setup()

-- Diagnostics
require("bearvim.plugins.config.diagnostics").setup()
require("bearvim.plugins.config.trouble").setup()

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

-- BufferLine
require("bearvim.plugins.config.buffline").setup()

-- Git
require("bearvim.plugins.config.git").setup()

-- Languages/Frameworks
require("bearvim.plugins.config.gonvim").setup() -- Go
require("bearvim.plugins.config.laravel").setup() -- Laravel

-- Autopairs
require("bearvim.plugins.config.autopairs").setup()

-- Folding
require("bearvim.plugins.config.ufo").setup()

-- Discord RPC
require("bearvim.plugins.config.cord").setup()

return M
