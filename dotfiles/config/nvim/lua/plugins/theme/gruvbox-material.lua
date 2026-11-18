return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    lazy = false,

    init = function()
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_foreground = "material"

      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_enable_bold = true

      vim.g.gruvbox_material_better_performance = 1

      vim.g.gruvbox_material_transparent_background = 2

      vim.g.gruvbox_material_float_style = "blend"

      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"

      vim.g.gruvbox_material_ui_contrast = "low"

      vim.g.gruvbox_material_show_eob = 0
    end,

    config = function()
      vim.cmd.colorscheme("gruvbox-material")

      local colors = require("utils.colors")

      local function apply_highlights()
        vim.api.nvim_set_hl(0, "Cursor", {
          fg = colors.dark,
          bg = colors.rose,
        })

        vim.api.nvim_set_hl(0, "CursorLineNr", {
          fg = colors.rose,
          bold = true,
          bg = "NONE",
        })

        vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "CursorLineFold", { bg = "NONE" })

        -- vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = colors.dark })
        -- vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = colors.dark })
        -- vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = colors.dark })

        vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "NONE" })

        vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

        local transparent_groups = {
          "NormalFloat",
          "FloatBorder",
          "FloatTitle",
          "Pmenu",
          "PmenuSbar",
          "NoicePopup",
          "NoicePopupBorder",
          "NoiceCmdlinePopup",
          "NoiceCmdlinePopupBorder",
          "NoiceCmdlinePopupTitle",
          "NoiceConfirm",
          "NoiceConfirmBorder",
          "NoiceMini",
          "NotifyBackground",
        }

        for _, group in ipairs(transparent_groups) do
          vim.api.nvim_set_hl(0, group, { bg = "NONE" })
        end
      end

      apply_highlights()

      vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
        callback = apply_highlights,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
