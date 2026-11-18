return {
  "tamton-aquib/duck.nvim",

  keys = {
    {
      "<leader>pd",
      function()
        require("duck").hatch("🦆", 2)
      end,
      desc = "Spawn Duck",
    },
    {
      "<leader>pc",
      function()
        require("duck").hatch("🐈", 1)
      end,
      desc = "Spawn Cat",
    },
    {
      "<leader>pD",
      function()
        require("duck").hatch("🐕", 0.75)
      end,
      desc = "Spawn Dog",
    },
    {
      "<leader>pt",
      function()
        require("duck").hatch("🐢", 0.3)
      end,
      desc = "Spawn Turtle",
    },
    {
      "<leader>pk",
      function()
        require("duck").cook()
      end,
      desc = "Remove Last Pet",
    },
    {
      "<leader>pK",
      function()
        require("duck").cook_all()
      end,
      desc = "Remove All Pets",
    },
  },
}
