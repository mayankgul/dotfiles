return {
  "MagicDuck/grug-far.nvim",

  cmd = "GrugFar",

  opts = {
    debounceMs = 300,

    engines = {
      ripgrep = {
        path = "rg",
      },
    },

    transient = true,

    keymaps = {
      close = { "q" },
    },
  },

  keys = {
    {
      "<leader>sr",
      function()
        require("grug-far").open()
      end,
      desc = "Search & Replace",
    },
  },
}
