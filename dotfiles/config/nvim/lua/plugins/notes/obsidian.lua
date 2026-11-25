return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  version = "*",
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "notes",
          path = [[~/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes/]],
        },
      },

      notes_subdir = "main",
      new_note_location = "notes_subdir",

      daily_notes = {
        folder = "journal",
        date_format = "%Y-%m-%d",
        alias_format = "%d %b %Y",
        template = [[templates/Daily Note Template.md]],
      },

      completion = {
        nvim_cmp = pcall(require, "cmp"),
        min_chars = 2,
      },

      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_pass_through()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },

        ["<leader>ch"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },

        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },

      new_notes_location = "notes_subdir",

      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        local suffix = ""

        if title ~= nil then
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          for _ in 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end

        return tostring(os.time()) .. "-" .. suffix
      end,

      ---@param url string
      follow_url_func = function(url)
        vim.ui.open(url)
      end,

      attachments = {
        img_folder = "attachments",

        ---@return string
        img_name_func = function()
          return string.format("%s-", os.time())
        end,
      },

      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },

      note_frontmatter_func = function(note)
        if note.title then
          note:add_alias(note.title)
        end

        local path = tostring(note.path or "")

        if path:find("tags", 1, true) then
          return {
            id = note.id,
            aliases = {},
          }
        end

        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        if path:find("dsa", 1, true) then
          out.tags = #note.tags > 0 and note.tags or { "dsa", "leetcode" }
          out.platform = "leetcode"
          out.pattern = ""
          out.difficulty = ""
          out.review_count = 0
          out.last_reviewed = os.date("%Y-%m-%d")
        end

        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,
    })

    require("utils.obsidian_backlinks").setup()
  end,

  vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", {
    buffer = true,
    desc = "Open note in Obsidian",
  }),
}
