local colors = require("utils.colors")

return {
  {
    "kawre/leetcode.nvim",
    cmd = "Leet",
    build = ":TSUpdate html",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },

    opts = {
      lang = "cpp",

      theme = {
        [""] = { fg = colors.fg },
        normal = { fg = colors.fg },
        alt = { fg = colors.fg_muted },

        easy = { fg = colors.green },
        medium = { fg = colors.yellow },
        hard = { fg = colors.red },

        easy_alt = { fg = colors.green, bg = colors.bg_soft },
        medium_alt = { fg = colors.yellow, bg = colors.bg_soft },
        hard_alt = { fg = colors.red, bg = colors.bg_soft },

        ok = { fg = colors.green },
        info = { fg = colors.blue },
        hint = { fg = colors.aqua },
        error = { fg = colors.red },

        case_ok = { fg = colors.green, bg = colors.bg_soft, bold = true },
        case_err = { fg = colors.red, bg = colors.bg_soft, bold = true },
        case_focus_ok = { fg = colors.dark, bg = colors.green, bold = true },
        case_focus_err = { fg = colors.dark, bg = colors.red, bold = true },

        code = { fg = colors.fg, bg = colors.bg_soft },
        example = { fg = colors.aqua },
        constraints = { fg = colors.blue },
        header = { fg = colors.gold, bold = true },
        followup = { fg = colors.yellow, bold = true },
        indent = { fg = colors.gray },
        link = { fg = colors.blue, underline = true },
        list = { fg = colors.orange },
        ref = { fg = colors.purple },
        su = { fg = colors.yellow },

        all = { fg = colors.fg },
        all_alt = { fg = colors.fg_muted },
      },

      storage = {
        home = "~/Documents/Code/dsa/leetcode",
      },

      picker = {
        provider = "snacks-picker",
      },

      plugins = {
        non_standalone = true,
      },

      injector = {
        ["cpp"] = {
          imports = function()
            return {
              "#include <bits/stdc++.h>",
              "using namespace std;",
            }
          end,
        },
      },
    },

    keys = {
      { "<leader>lc", "<cmd>Leet<cr>", desc = "LeetCode" },
      { "<leader>lr", "<cmd>Leet run<cr>", desc = "Run solution" },
      { "<leader>ls", "<cmd>Leet submit<cr>", desc = "Submit solution" },
    },
  },
}
