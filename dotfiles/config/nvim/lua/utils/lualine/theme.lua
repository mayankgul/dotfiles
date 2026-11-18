local colors = require("utils.colors")

return {
  theme = {
    normal = {
      a = { fg = colors.dark, bg = colors.blue, gui = "bold" },
      b = { fg = colors.fg, bg = "NONE" },
      c = { fg = colors.fg, bg = "NONE" },
    },
    insert = {
      a = { fg = colors.dark, bg = colors.green, gui = "bold" },
    },
    visual = {
      a = { fg = colors.dark, bg = colors.purple, gui = "bold" },
    },
    replace = {
      a = { fg = colors.dark, bg = colors.red, gui = "bold" },
    },
    command = {
      a = { fg = colors.dark, bg = colors.yellow, gui = "bold" },
    },
    inactive = {
      a = { fg = colors.gray, bg = "NONE" },
      b = { fg = colors.gray, bg = "NONE" },
      c = { fg = colors.gray, bg = "NONE" },
    },
  },
}
