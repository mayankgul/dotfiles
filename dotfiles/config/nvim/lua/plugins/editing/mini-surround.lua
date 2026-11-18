return {
  "nvim-mini/mini.surround",

  version = false,

  event = "BufReadPre",

  opts = {
    mappings = {
      add = "sa",
      delete = "sd",
      replace = "sr",
      find = "sf",
      find_left = "sF",
      highlight = "sh",
      update_n_lines = "sn",
    },
  },

  keys = {
    {
      "S",
      mode = "x",
      function()
        MiniSurround.add("visual")
      end,
      desc = "Surround Selection",
    },
  },
}
