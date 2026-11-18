return {
  {
    "yetone/avante.nvim",

    event = "VeryLazy",

    version = false,

    build = "make",

    keys = {
      { "<leader>aa", "<cmd>AvanteAsk<CR>", desc = "Ask AI" },
      { "<leader>ac", "<cmd>AvanteChat<CR>", desc = "Chat" },
      { "<leader>at", "<cmd>AvanteToggle<CR>", desc = "Toggle Sidebar" },
      { "<leader>an", "<cmd>AvanteChatNew<CR>", desc = "New Chat" },
      { "<leader>ah", "<cmd>AvanteHistory<CR>", desc = "Chat History" },
    },

    opts = {
      provider = "copilot",
      -- auto_suggestions_provider = "copilot",
      -- copilot = {
      --   model = "claude-3.7-sonnet",
      -- },

      behaviour = {
        auto_set_keymaps = false,
      },

      selection = {
        hint_display = "none",
      },

      input = {
        provider = "snacks",
      },
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",

      "MeanderingProgrammer/render-markdown.nvim",

      "HakonHarnes/img-clip.nvim",

      "zbirenbaum/copilot.lua",

      {
        "ColinKennedy/mega.cmdparse",
        dependencies = {
          "ColinKennedy/mega.logging",
        },
      },
    },
  },
}
