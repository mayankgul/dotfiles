return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local colors = require("utils.colors")

      local function pomodoro_component()
        local pomodoro = require("pomodoro")
        local Phases = require("pomodoro.constants").Phases

        if pomodoro.phase == Phases.NOT_RUNNING then
          return ""
        end

        return pomodoro.get_pomodoro_status("", "󰔟", "󰏤")
      end

      local function pomodoro_color()
        local pomodoro = require("pomodoro")
        local Phases = require("pomodoro.constants").Phases

        if pomodoro.phase == Phases.BREAK then
          return {
            fg = colors.orange,
            gui = "bold",
          }
        end

        return {
          fg = colors.green,
          gui = "bold",
        }
      end

      local function buffer_size()
        local bufnr = vim.api.nvim_get_current_buf()

        -- Get the buffer's contents
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        local content = table.concat(lines, "\n")

        -- Include a trailing newline if the buffer has one
        if vim.bo[bufnr].endofline then
          content = content .. "\n"
        end

        local size = #content

        if size < 1024 then
          return string.format("%d B", size)
        elseif size < 1024 * 1024 then
          return string.format("%.1f KB", size / 1024)
        else
          return string.format("%.1f MB", size / (1024 * 1024))
        end
      end

      local function lsp_client()
        local ignored = {
          copilot = true,
          cspell_ls = true,
          null_ls = true,
          custom_elements_ls = true,
          cssmodules_ls = true,
          tailwindcss = true,
        }

        local clients = vim.lsp.get_clients({
          bufnr = 0,
        })

        local names = {}

        for _, client in ipairs(clients) do
          if not ignored[client.name] then
            table.insert(names, client.name)
          end
        end

        if #names == 0 then
          return ""
        end

        table.sort(names)

        return "󰒋 " .. table.concat(names, ", ")
      end

      vim.api.nvim_set_hl(0, "LualineModified", {
        fg = colors.blue,
        bold = true,
      })

      vim.api.nvim_set_hl(0, "LualineReadonly", {
        fg = colors.red,
        bold = true,
      })

      require("lualine").setup({
        options = {
          theme = require("utils.lualine.theme").theme,
          globalstatus = true,
          icons_enabled = true,

          section_separators = {
            left = "",
            right = "",
          },

          component_separators = {
            left = " ",
            right = " ",
          },

          disabled_filetypes = {
            statusline = {
              "snacks_dashboard",
              "alpha",
              "dashboard",
            },
          },
        },

        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                return " " .. str
              end,
              separator = {
                left = "",
                right = "",
              },
              padding = {
                left = 0.5,
                right = 0.5,
              },
            },
          },

          lualine_b = {
            -- Git branch
            {
              "branch",
              icon = "󰘬",
              padding = {
                left = 2,
                right = 0.5,
              },
              color = {
                fg = colors.blue,
                gui = "bold",
              },
            },
          },

          lualine_c = {
            {
              require("utils.lualine.components").pretty_filename,

              padding = {
                left = 2,
              },

              fmt = function(str)
                return str
              end,

              color = {
                fg = colors.strong_fg,
                gui = "bold",
              },
            },

            {
              "diagnostics",
              padding = {
                left = 1,
              },
              sources = { "nvim_diagnostic" },
              sections = { "error", "warn", "info" },
              diagnostics_color = {
                error = { fg = colors.red },
                warn = { fg = colors.yellow },
                info = { fg = colors.blue },
              },
              symbols = {
                error = " ",
                warn = " ",
                info = " ",
              },
            },
          },

          lualine_x = {
            {
              require("utils.lualine.components").search_result,

              color = {
                fg = colors.purple,
              },

              padding = {
                right = 2,
              },
            },

            {
              require("utils.lualine.components").recording_macro,

              color = {
                -- fg = colors.yellow,
                fg = colors.orange,
                gui = "bold",
              },

              padding = {
                right = 2,
              },
            },

            {
              "filetype",
              padding = {
                right = 2,
              },
              colored = true,
              icon_only = false,
            },

            {
              lsp_client,

              color = {
                fg = colors.lavender,
                gui = "bold",
              },

              padding = {
                right = 2,
              },
            },
          },

          lualine_y = {
            {
              pomodoro_component,

              cond = function()
                local pomodoro = require("pomodoro")
                local Phases = require("pomodoro.constants").Phases

                return pomodoro.phase ~= Phases.NOT_RUNNING
              end,

              color = pomodoro_color,

              padding = {
                right = 2,
              },
            },

            {
              buffer_size,

              color = {
                fg = colors.blue,
                gui = "bold",
              },

              padding = {
                right = 2,
              },
            },
          },

          lualine_z = {
            {
              function()
                return " " .. os.date("%H:%M")
              end,

              padding = {
                left = 1,
                right = 1,
              },

              color = {
                fg = colors.dark,
                gui = "bold",
              },
            },
          },
        },

        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            require("utils.lualine.components").pretty_filename,
          },

          lualine_x = {},
          lualine_y = {},
          lualine_z = {
            "location",
          },
        },

        extensions = {
          "lazy",
          "mason",
          "quickfix",
        },
      })
    end,
  },
}
