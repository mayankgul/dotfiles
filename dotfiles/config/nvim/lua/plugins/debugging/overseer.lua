return {
  {
    "stevearc/overseer.nvim",

    cmd = {
      "OverseerRun",
      "OverseerToggle",
      "OverseerOpen",
      "OverseerClose",
      "OverseerShell",
      "OverseerTaskAction",
    },

    opts = {
      -- Task list appearance
      task_list = {
        direction = "bottom",

        min_height = 10,
        max_height = 15,

        -- Keep the task list reasonably compact
        separator = "──────────────────────────────",
      },

      -- Task output window
      output = {
        use_terminal = true,
        preserve_output = true,
      },

      -- Floating task windows
      task_win = {
        border = "rounded",
        padding = 2,
      },

      -- Floating task input forms
      form = {
        border = "rounded",
      },

      -- Default log verbosity
      log_level = vim.log.levels.WARN,
    },

    keys = {
      {
        "<leader>or",
        "<cmd>OverseerRun<CR>",
        desc = "Run Task",
      },
      {
        "<leader>ot",
        "<cmd>OverseerToggle<CR>",
        desc = "Toggle Task List",
      },
      {
        "<leader>oo",
        "<cmd>OverseerOpen<CR>",
        desc = "Open Task List",
      },
      {
        "<leader>oc",
        "<cmd>OverseerClose<CR>",
        desc = "Close Task List",
      },
      {
        "<leader>oR",
        "<cmd>OverseerTaskAction<CR>",
        desc = "Task Actions",
      },
      {
        "<leader>os",
        "<cmd>OverseerShell<CR>",
        desc = "Run Shell Command",
      },
    },
  },
}
