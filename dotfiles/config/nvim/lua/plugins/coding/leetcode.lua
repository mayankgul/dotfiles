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
