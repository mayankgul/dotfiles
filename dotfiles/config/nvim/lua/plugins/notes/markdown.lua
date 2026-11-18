return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.icons",
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      latext = {
        enable = true,
      },
      image = {
        enable = true,
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",

    build = "cd app && npm install",

    ft = {
      "markdown",
    },

    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
  {
    "3rd/image.nvim",

    opts = {
      backend = "kitty",
      processor = "magick_cli",

      -- window_overlap_clear_enabled = true,
      -- editor_only_render_when_focused = true,

      integrations = {
        markdown = {
          enabled = true,

          resolve_image_path = function(document_path, image_path)
            local vault = vim.fn.expand("~/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes")

            -- Absolute path
            if vim.fn.filereadable(image_path) == 1 then
              return image_path
            end

            -- Relative to current note
            local note_dir = vim.fn.fnamemodify(document_path, ":h")
            local candidate = note_dir .. "/" .. image_path

            if vim.fn.filereadable(candidate) == 1 then
              return candidate
            end

            -- Obsidian attachments folder
            candidate = vault .. "/attachments/" .. image_path

            if vim.fn.filereadable(candidate) == 1 then
              return candidate
            end

            return image_path
          end,
        },
      },
    },
  },
}
