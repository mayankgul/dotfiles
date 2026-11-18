return {
  "sindrets/diffview.nvim",

  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewFileHistory",
  },

  keys = {
    {
      "<leader>gd",
      "<cmd>DiffviewOpen<CR>",
      desc = "Git Diff",
    },

    {
      "<leader>gh",
      "<cmd>DiffviewFileHistory %<CR>",
      desc = "File History",
    },

    {
      "<leader>gH",
      "<cmd>DiffviewFileHistory<CR>",
      desc = "Repo History",
    },
  },

  opts = {
    enhanced_diff_hl = true,

    use_icons = true,

    show_help_hints = false,

    view = {
      merge_tool = {
        layout = "diff3_mixed",
      },
    },

    file_panel = {
      win_config = {
        width = 36,
      },
    },
  },
}
