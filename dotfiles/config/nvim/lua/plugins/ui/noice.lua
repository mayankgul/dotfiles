return {
  {
    "folke/noice.nvim",

    opts = {
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },

      cmdline = {
        enabled = true,

        view = "cmdline_popup",
      },

      views = {
        cmdline_popup = {
          position = {
            row = "85%",
            col = "50%",
          },

          size = {
            width = 60,
            height = "auto",
          },

          border = {
            style = "rounded",
            padding = {
              0,
              1,
            },
          },

          win_options = {
            winblend = 0,
          },
        },

        popupmenu = {
          relative = "editor",

          position = {
            row = "91%",
            col = "50%",
          },

          size = {
            width = 60,
            height = 10,
          },

          border = {
            style = "rounded",
            padding = {
              0,
              1,
            },
          },

          win_options = {
            winblend = 0,
          },
        },
        mini = {
          win_options = {
            winblend = 0,
          },
        },
        confirm = {
          win_options = {
            winblend = 0,
          },
        },
      },
    },

    config = function(_, opts)
      require("noice").setup(opts)

      local colors = require("utils.colors")

      local function apply()
        vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", {
          fg = colors.fg,
          bg = colors.menu,
        })

        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", {
          fg = colors.border,
          bg = colors.menu,
        })

        vim.api.nvim_set_hl(0, "NoicePopupmenu", {
          fg = colors.fg,
          bg = colors.menu,
        })

        vim.api.nvim_set_hl(0, "NoicePopupmenuBorder", {
          fg = colors.border,
          bg = colors.menu,
        })

        vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", {
          fg = colors.blue,
          bg = colors.menu,
          bold = true,
        })
      end

      apply()

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = apply,
      })
    end,
  },
}
