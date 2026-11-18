return {
  {
    "GCBallesteros/NotebookNavigator.nvim",

    ft = { "python" },

    dependencies = {
      "benlubas/molten-nvim",
      "nvim-mini/mini.comment",
    },

    opts = {
      activate_hydra_keys = "<leader>j",
      show_hydra_hint = true,
    },

    keys = {
      -----------------------------------------------------------------------
      -- Cell Navigation
      -----------------------------------------------------------------------
      {
        "]c",
        function()
          require("notebook-navigator").move_cell("d")
        end,
        desc = "Next Notebook Cell",
      },

      {
        "[c",
        function()
          require("notebook-navigator").move_cell("u")
        end,
        desc = "Previous Notebook Cell",
      },

      -----------------------------------------------------------------------
      -- Cell Execution
      -----------------------------------------------------------------------
      {
        "<leader>jr",
        function()
          require("notebook-navigator").run_cell()
        end,
        desc = "Run Cell",
      },

      {
        "<leader>jn",
        function()
          require("notebook-navigator").run_and_move()
        end,
        desc = "Run Cell and Move",
      },

      {
        "<leader>ja",
        function()
          require("notebook-navigator").run_all_cells()
        end,
        desc = "Run All Cells",
      },

      -----------------------------------------------------------------------
      -- Cell Editing
      -----------------------------------------------------------------------
      {
        "<leader>js",
        function()
          require("notebook-navigator").split_cell()
        end,
        desc = "Split Cell",
      },

      {
        "<leader>jm",
        function()
          require("notebook-navigator").merge_cell()
        end,
        desc = "Merge Cell",
      },

      -----------------------------------------------------------------------
      -- Jupyter-style Shortcuts
      -----------------------------------------------------------------------
      {
        "<S-CR>",
        function()
          require("notebook-navigator").run_and_move()
        end,
        mode = "n",
        desc = "Run Cell (Shift+Enter)",
      },

      {
        "<C-CR>",
        function()
          require("notebook-navigator").run_cell()
        end,
        mode = "n",
        desc = "Run Cell (Ctrl+Enter)",
      },
    },
  },
}
