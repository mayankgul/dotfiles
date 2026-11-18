return {
  {
    "folke/snacks.nvim",
    opts = {
      -- General explorer settings
      explorer = {
        replace_netrw = true,
        trash = true,
      },

      -- Explorer picker settings
      picker = {
        sources = {
          explorer = {
            -- Layout
            layout = {
              preset = "sidebar",
              preview = false,
              layout = {
                width = 25,
                min_width = 25,
                position = "left",
              },
            },

            -- Explorer behavior
            tree = true,
            watch = true,
            follow_file = true,

            -- Git integration
            git_status = true,
            git_status_open = false,
            git_untracked = true,

            -- LSP diagnostics
            diagnostics = true,
            diagnostics_open = false,

            -- Sorting
            matcher = {
              sort_empty = false,
              fuzzy = false,
            },

            -- Display
            formatters = {
              file = {
                filename_only = true,
              },
              severity = {
                pos = "right",
              },
            },
          },
        },
      },
    },
  },
}
