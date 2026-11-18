return {
  {
    "quarto-dev/quarto-nvim",

    ft = {
      "quarto",
      "markdown",
    },

    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
      "benlubas/molten-nvim",
    },

    opts = {
      lspFeatures = {
        enabled = true,

        chunks = "curly",

        languages = {
          "python",
          "lua",
          "bash",
          "json",
        },

        diagnostics = {
          enabled = true,
          triggers = {
            "BufWrite",
          },
        },

        completion = {
          enabled = true,
        },
      },

      codeRunner = {
        enabled = false,
      },
    },
  },

  {
    "jmbuhr/otter.nvim",

    opts = {},
  },
}
