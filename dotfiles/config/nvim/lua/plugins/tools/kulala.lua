local function apply_kulala_highlights()
  -- These groups link Kulala's interface to standard Neovim groups.
  -- Catppuccin already styles the target groups, so the result follows
  -- whichever Catppuccin flavour you currently use.
  vim.api.nvim_set_hl(0, "KulalaNormal", {
    link = "Normal",
  })

  vim.api.nvim_set_hl(0, "KulalaWinBar", {
    link = "StatusLine",
  })

  vim.api.nvim_set_hl(0, "KulalaWinBarNC", {
    link = "StatusLineNC",
  })

  vim.api.nvim_set_hl(0, "KulalaEndOfBuffer", {
    link = "Normal",
  })
end

return {
  {
    "mistweaverco/kulala.nvim",

    init = function()
      local curl_path = vim.fn.exepath("curl")

      if curl_path ~= "" then
        vim.env.KULALA_CURL_PATH = curl_path
      end

      apply_kulala_highlights()

      -- Reapply links whenever Catppuccin or another colorscheme reloads.
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("kulala_theme_highlights", { clear = true }),
        callback = apply_kulala_highlights,
      })
    end,

    opts = function(_, opts)
      opts = opts or {}

      local tree_sitter_path = vim.fn.exepath("tree-sitter")

      opts.treesitter = vim.tbl_deep_extend("force", opts.treesitter or {}, {
        -- Let Kulala download, build and install its own HTTP grammar.
        enable = true,

        -- Use the absolute executable path when available.
        cli_path = tree_sitter_path ~= "" and tree_sitter_path or "tree-sitter",
      })

      -- Environments are selected separately for each .http buffer.
      opts.default_env = "default"
      opts.environment_scope = "b"

      opts.response_format = vim.tbl_deep_extend("force", opts.response_format or {}, {
        indent = 2,
        expand_tabs = true,
        sort_keys = false,
      })

      opts.ui = vim.tbl_deep_extend("force", opts.ui or {}, {
        -- Keep the request and response visible simultaneously.
        display_mode = "split",

        -- Use a right split on a wide screen and a bottom split in a
        -- narrow terminal or small Neovim window.
        split_direction = function()
          if vim.o.columns >= 150 then
            return "right"
          end

          return "below"
        end,

        default_view = "body",

        -- Provides tabs for the different response representations.
        winbar = true,

        default_winbar_panes = {
          "body",
          "headers",
          "stats",
          "script_output",
          "report",
          "help",
        },

        -- Clean labels for Kulala's response winbar.
        winbar_labels = {
          body = " Body ",
          headers = " Headers ",
          headers_body = " All ",
          verbose = " Verbose ",
          script_output = " Scripts ",
          stats = " Stats ",
          report = " Report ",
          help = " Help ",
        },

        -- Keep shortcut hints visible while learning Kulala.
        -- Change this to false later for a more minimal winbar.
        winbar_labels_keymaps = true,

        -- Display request state next to the request itself.
        show_icons = "on_request",

        icons = {
          inlay = {
            loading = "●",
            done = "✓",
            error = "✗",
          },

          lualine = "",

          -- These standard groups are already styled by Catppuccin.
          textHighlight = "Comment",
          loadingHighlight = "DiagnosticInfo",
          doneHighlight = "DiagnosticOk",
          errorHighlight = "DiagnosticError",
        },

        show_variable_info_text = false,
        show_request_summary = true,

        win_opts = {
          bo = {},

          wo = {
            number = false,
            relativenumber = false,
            signcolumn = "no",
            foldcolumn = "0",
            cursorline = false,

            -- Wrap long JSON strings and headers instead of cutting them.
            wrap = true,
            linebreak = true,

            winhl = table.concat({
              "Normal:KulalaNormal",
              "NormalNC:KulalaNormal",
              "WinBar:KulalaWinBar",
              "WinBarNC:KulalaWinBarNC",
              "EndOfBuffer:KulalaEndOfBuffer",
            }, ","),
          },
        },

        report = {
          show_script_output = true,
          show_asserts_output = true,
          show_summary = true,

          headersHighlight = "Title",
          successHighlight = "DiagnosticOk",
          errorHighlight = "DiagnosticError",
        },

        scratchpad_default_contents = {
          "@baseUrl = https://echo.kulala.app",
          "",
          "### Test Kulala",
          "# @name testKulala",
          "POST {{baseUrl}}/post",
          "Accept: application/json",
          "Content-Type: application/json",
          "",
          "{",
          '  "message": "Kulala is working",',
          '  "editor": "LazyVim"',
          "}",
        },
      })

      return opts
    end,
  },
}
