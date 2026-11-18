return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },

    keys = {
      {
        "<C-c>",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find Files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep (telescope)",
      },
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function(_, opts)
      opts.extensions = opts.extensions or {}

      opts.extensions["ui-select"] = {
        require("telescope.themes").get_dropdown({
          -- even more opts
        }),
      }

      require("telescope").setup(opts)

      require("telescope").load_extension("ui-select")
    end,
  },
}
