return {
  "chrisgrieser/nvim-spider",

  keys = {
    {
      "w",
      function()
        require("spider").motion("w")
      end,
      mode = { "n", "o", "x" },
      silent = true,
      desc = "Spider Forward Word",
    },
    {
      "e",
      function()
        require("spider").motion("e")
      end,
      mode = { "n", "o", "x" },
      silent = true,
      desc = "Spider End Word",
    },
    {
      "b",
      function()
        require("spider").motion("b")
      end,
      mode = { "n", "o", "x" },
      silent = true,
      desc = "Spider Back Word",
    },
  },
}
