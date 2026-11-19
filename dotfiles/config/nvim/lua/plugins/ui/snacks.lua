return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        enabled = false,
      },

      -- styles = {
      --   terminal = {
      --     position = "float",
      --     height = 0.8,
      --     width = 0.8,
      --   },
      -- },

      dashboard = {
        preset = {
          header = require("utils.dashboard").header,
        },

        sections = {
          {
            section = "header",
            -- padding = 2,
          },

          -- {
          --   section = "terminal",
          --   cmd = "chafa ~/.config/nvim/assets/neovim.png --format symbols --symbols vhalf --size 16x8; sleep .1",
          --   height = 8,
          --   padding = 1,
          -- },
          --
          -- {
          --   section = "terminal",
          --   cmd = "python3 ~/.config/nvim/scripts/dashboard.py",
          --   height = 10,
          --   padding = 1,
          -- },

          {
            text = {
              "",
              "MAYANK'S NEOVIM",
              "",
            },
            align = "center",
            hl = "Title",
            padding = 1,
          },

          {
            section = "keys",
            gap = 1,
            padding = 2,
          },

          {
            icon = " ",
            title = "Recent Files",
            section = "recent_files",
            indent = 2,
            limit = 5,
            padding = 2,
          },

          {
            icon = " ",
            title = "Projects",
            section = "projects",
            indent = 2,
            limit = 5,
            padding = 2,
          },

          {
            section = "startup",
            padding = 2,
          },
        },
      },
    },
  },
}
