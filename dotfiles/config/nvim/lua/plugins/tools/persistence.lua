return {
  {
    "folke/persistence.nvim",

    event = "BufReadPre",

    opts = {
      -- Where session files are stored
      dir = vim.fn.stdpath("state") .. "/sessions/",

      -- Require at least one file buffer before saving
      need = 1,

      -- Keep separate sessions for different Git branches
      branch = true,
    },

    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").save()
        end,
        desc = "Save Session",
      },
      {
        "<leader>ql",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "Restore Last Session",
      },
      {
        "<leader>qS",
        function()
          require("persistence").select()
        end,
        desc = "Select Session",
      },
      {
        "<leader>qr",
        function()
          require("persistence").load()
        end,
        desc = "Restore Current Project Session",
      },
      {
        "<leader>qd",
        function()
          require("persistence").stop()
          vim.notify("Session autosaving disabled for this Neovim instance")
        end,
        desc = "Disable Session Autosave",
      },
    },
  },
}
