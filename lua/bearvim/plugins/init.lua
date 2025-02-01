return {
  -- Misc
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "Darazaki/indent-o-matic" },
  { "lukas-reineke/indent-blankline.nvim", name = "ibl" },
  { "stevearc/conform.nvim" },
  { "tamago324/lir.nvim", event = "User DirOpened" },

  -- LSP and Treesitter
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "nvimtools/none-ls.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  { "jay-babu/mason-null-ls.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- KeyMapping
  { "folke/which-key.nvim", opts = {} },
}
