return {
  {
    "mikavilpas/yazi.nvim",

    dependencies = {
      "folke/snacks.nvim",
    },

    opts = {
      open_for_directories = true,

      floating_window_scaling_factor = 0.92,

      yazi_floating_window_border = "rounded",

      open_multiple_tabs = false,

      highlight_groups = {
        hovered_buffer = "Visual",
        hovered_buffer_in_same_directory = "CursorLine",
      },
    },

    keys = {
      {
        "<leader>fy",
        "<cmd>Yazi<CR>",
        desc = "Open Yazi",
      },
    },

    config = function(_, opts)
      vim.keymap.del("n", "<leader><leader>")
      require("yazi").setup(opts)
    end,
  },
}
