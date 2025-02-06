local deps = require("bearvim.plugins.deps")

return {
  -- Misc
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "Darazaki/indent-o-matic" },
  { "lukas-reineke/indent-blankline.nvim", name = "ibl" },
  { "stevearc/conform.nvim" },
  { "tamago324/lir.nvim", event = "User DirOpened" },
  { "nvim-tree/nvim-web-devicons", opt = true },

  -- Interface
  { "nvim-lualine/lualine.nvim" },
  { "akinsho/bufferline.nvim" },
  { "ray-x/guihua.lua" },

  -- LSP + Treesitter
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "nvimtools/none-ls.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  { "jay-babu/mason-null-ls.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Languages/Frameworks
  { "ray-x/go.nvim", ft = { "go", "gomod" }, build = ":lua require'go.install'.update_all_sync()" },
  { "ricardoramirezr/blade-nav.nvim", ft = { "blade", "php" } },
  { "adalessa/laravel.nvim", dependencies = deps.laravel_deps, event = "VeryLazy", cmd = { "Laravel" }, config = true },

  -- Completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- KeyMapping
  { "folke/which-key.nvim" },

  -- Git
  { "lewis6991/gitsigns.nvim" },

  -- Folding
  { "chrisgrieser/nvim-origami", event = "VeryLazy" },
}
