return {
  {
    "nvim-neo-tree/neo-tree.nvim",

    opts = {
      -- General settings
      close_if_last_window = false,
      enable_git_status = true,
      enable_diagnostics = true,
      enable_modified_markers = true,
      enable_opened_markers = true,

      -- Keep the explorer sources
      sources = {
        "filesystem",
        "buffers",
        "git_status",
      },

      -- Do not replace special-purpose windows
      open_files_do_not_replace_types = {
        "terminal",
        "Trouble",
        "trouble",
        "qf",
        "Outline",
      },

      -- Window appearance
      window = {
        position = "left",
        width = 30,

        mappings = {
          -- Navigation
          ["l"] = "open",
          ["h"] = "close_node",
          ["<space>"] = "none",

          -- Copy absolute path
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
            end,
            desc = "Copy absolute path",
          },

          -- Preview files in the editor layout
          ["P"] = {
            "toggle_preview",
            config = {
              use_float = false,
            },
          },
        },
      },

      -- Filesystem settings
      filesystem = {
        bind_to_cwd = false,

        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },

        use_libuv_file_watcher = true,

        group_empty_dirs = false,

        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },

      -- Indentation and folder indicators
      default_component_configs = {
        indent = {
          with_expanders = true,
          indent_size = 2,
          padding = 1,

          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },

        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },

        modified = {
          symbol = "[+]",
        },
      },
    },
  },
}
