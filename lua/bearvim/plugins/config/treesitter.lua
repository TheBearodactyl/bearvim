local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup({
    sync_install = false,
    auto_install = true,

    ensure_installed = {
      "lua",
      "json",
      "vim",
      "yaml",
      "rust",
      "c",
      "cpp",
      "php",
      "html",
    },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    indent = {
      enable = true,
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },

    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
  })

  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

  parser_config.blade = {
    install_info = {
      url = "https://github.com/EmranMR/tree-sitter-blade",
      files = { "src/parser.c" },
      branch = "main",
    },
    filetype = "blade",
  }
end

return M
