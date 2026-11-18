return {
  {
    "quentingruber/pomodoro.nvim",
    lazy = false,

    opts = {
      start_at_launch = false,

      work_duration = 25,
      break_duration = 5,
      long_break_duration = 15,
      breaks_before_long = 4,

      delay_duration = 1,

      -- Automatically show the new top-right UI when a break starts.
      display_ui_on_break = true,
    },

    config = function(_, opts)
      local pomodoro = require("pomodoro")

      pomodoro.setup(opts)

      require("utils.pomodoro_ui").setup(pomodoro, {
        -- Popup dimensions and placement.
        width = 38,
        top = 1,
        right = 2,
        border = "rounded",
      })
    end,

    keys = {
      {
        "<leader>Ps",
        "<cmd>PomodoroStart<cr>",
        desc = "Start Pomodoro",
      },
      {
        "<leader>Px",
        "<cmd>PomodoroStop<cr>",
        desc = "Stop Pomodoro",
      },
      {
        "<leader>Pu",
        "<cmd>PomodoroUI<cr>",
        desc = "Toggle Pomodoro UI",
      },
      {
        "<leader>Pb",
        "<cmd>PomodoroForceBreak<cr>",
        desc = "Start Pomodoro break",
      },
      {
        "<leader>Pk",
        "<cmd>PomodoroSkipBreak<cr>",
        desc = "Skip Pomodoro break",
      },
      {
        "<leader>Pd",
        "<cmd>PomodoroDelayBreak<cr>",
        desc = "Delay Pomodoro break",
      },
    },
  },
}
