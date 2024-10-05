return {
  -- Formatter al guardar
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  -- Servidores de lenguaje
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Colores
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css"
      },
    },
  },

  -- Color picker
  -- { "nvchad/volt",  lazy = true },
  -- { "nvchad/minty", lazy = true },

  -- Colorines en las indentaciones
  -- No consigo que me guste
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   opts = {
  --     scope = {
  --       enabled = true,
  --       show_start = true,
  --     },
  --   }
  -- },
}
