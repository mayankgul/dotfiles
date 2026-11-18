return {
  {
    "Bekaboo/dropbar.nvim",
    lazy = false,

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      bar = {
        padding = {
          left = 1,
          right = 1,
        },

        -- Slightly reduce unnecessary redraws while scrolling.
        update_debounce = 75,

        truncate = true,
      },

      menu = {
        preview = true,
        hover = true,
        quick_navigation = true,

        entry = {
          padding = {
            left = 1,
            right = 1,
          },
        },

        scrollbar = {
          enable = true,

          -- Only show the thumb, not the scrollbar gutter.
          background = false,
        },

        win_configs = {
          border = "rounded",
        },
      },

      icons = {
        ui = {
          bar = {
            -- Cleaner than the default heavy breadcrumb separator.
            separator = "  ›  ",
            extends = "…",
          },

          menu = {
            separator = " ",
            indicator = "› ",
          },
        },
      },

      sources = {
        -- Avoid an excessively long directory breadcrumb.
        path = {
          max_depth = 3,
        },

        -- Keep enough symbol context without filling the entire winbar.
        lsp = {
          max_depth = 4,
        },

        treesitter = {
          max_depth = 4,
        },

        markdown = {
          max_depth = 3,
        },
      },
    },

    config = function(_, opts)
      require("dropbar").setup(opts)

      local function setup_highlights()
        local colors = require("utils.colors")

        -- Winbar
        vim.api.nvim_set_hl(0, "WinBar", {
          fg = colors.gray,
          bg = colors.bg,
        })

        vim.api.nvim_set_hl(0, "WinBarNC", {
          fg = colors.gray,
          bg = colors.bg,
        })

        -- Current breadcrumb
        vim.api.nvim_set_hl(0, "DropBarCurrentContext", {
          fg = colors.bright,
          bg = colors.bg,
          bold = true,
        })

        -- Hover
        vim.api.nvim_set_hl(0, "DropBarHover", {
          fg = colors.bright,
          bg = colors.bg,
        })

        -- Separators
        vim.api.nvim_set_hl(0, "DropBarIconUISeparator", {
          fg = colors.gray,
          bg = colors.bg,
        })

        vim.api.nvim_set_hl(0, "DropBarIconUISeparatorMenu", {
          fg = colors.gray,
          bg = colors.menu,
        })

        -- Popup
        vim.api.nvim_set_hl(0, "DropBarMenuNormalFloat", {
          fg = colors.fg,
          bg = colors.menu,
        })

        vim.api.nvim_set_hl(0, "DropBarMenuFloatBorder", {
          fg = colors.border,
          bg = colors.menu,
        })

        vim.api.nvim_set_hl(0, "DropBarMenuCurrentContext", {
          fg = colors.bright,
          bg = colors.menu,
          bold = true,
        })

        vim.api.nvim_set_hl(0, "DropBarIconUIPickPivot", {
          fg = colors.blue,
          bold = true,
        })
      end

      setup_highlights()

      -- Reapply custom groups whenever the colorscheme is reloaded.
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("dropbar_highlights", { clear = true }),
        callback = setup_highlights,
      })
    end,

    keys = {
      {
        "<leader>gb",
        function()
          require("dropbar.api").pick()
        end,
        desc = "Pick breadcrumb symbol",
      },
      {
        "[;",
        function()
          require("dropbar.api").goto_context_start()
        end,
        desc = "Go to context start",
      },
      {
        "];",
        function()
          require("dropbar.api").select_next_context()
        end,
        desc = "Select next context",
      },
    },
  },
}
