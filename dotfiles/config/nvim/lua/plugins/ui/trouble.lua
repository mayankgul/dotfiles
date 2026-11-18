return {
  {
    "folke/trouble.nvim",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    opts = {},

    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<CR>",
        desc = "Diagnostics",
      },

      {
        "<leader>xr",
        "<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
        desc = "References",
      },

      {
        "<leader>xs",
        "<cmd>Trouble symbols toggle focus=false<CR>",
        desc = "Symbols",
      },
    },
  },
}
