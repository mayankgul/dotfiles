return {
  "The-Silent-One/goose.nvim",

  keys = {
    {
      "<leader>pg",
      function()
        require("goose").hatch()
      end,
      desc = "Spawn Goose",
    },
    {
      "<leader>pG",
      function()
        require("goose").cook()
      end,
      desc = "Cook Goose",
    },
  },
}
