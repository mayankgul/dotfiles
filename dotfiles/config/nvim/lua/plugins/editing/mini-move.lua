return {
  "nvim-mini/mini.move",

  version = false,

  event = "BufReadPre",

  opts = {
    mappings = {
      left = "",
      right = "",
      down = "",
      up = "",

      line_left = "",
      line_right = "",
      line_down = "",
      line_up = "",
    },
  },

  keys = {
    {
      "<leader>mh",
      function()
        require("mini.move").move_line("left")
      end,
      desc = "Move Line Left",
    },
    {
      "<leader>mj",
      function()
        require("mini.move").move_line("down")
      end,
      desc = "Move Line Down",
    },
    {
      "<leader>mk",
      function()
        require("mini.move").move_line("up")
      end,
      desc = "Move Line Up",
    },
    {
      "<leader>ml",
      function()
        require("mini.move").move_line("right")
      end,
      desc = "Move Line Right",
    },

    {
      "<leader>mh",
      function()
        require("mini.move").move_selection("left")
      end,
      mode = "x",
      desc = "Move Selection Left",
    },
    {
      "<leader>mj",
      function()
        require("mini.move").move_selection("down")
      end,
      mode = "x",
      desc = "Move Selection Down",
    },
    {
      "<leader>mk",
      function()
        require("mini.move").move_selection("up")
      end,
      mode = "x",
      desc = "Move Selection Up",
    },
    {
      "<leader>ml",
      function()
        require("mini.move").move_selection("right")
      end,
      mode = "x",
      desc = "Move Selection Right",
    },
  },
}
