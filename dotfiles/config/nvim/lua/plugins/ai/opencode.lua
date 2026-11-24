return {
  {
    "nickjvandyke/opencode.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },

    config = function()
      -- OpenCode configuration
      vim.g.opencode_opts = {
        -- Use the plugin's default server behavior.
        -- It discovers an existing OpenCode server or starts one
        -- in a Neovim terminal split when needed.

        select = {
          prompts = {
            explain = "Explain @this and its context",
            review = "Review @this for correctness, readability, and potential bugs",
            fix = "Fix @diagnostics",
            test = "Add tests for @this",
            optimize = "Optimize @this for performance and readability",
            document = "Add comments documenting @this",
            implement = "Implement @this",
          },
        },
      }

      -- Ask OpenCode with the current selection or cursor context.
      vim.keymap.set({ "n", "x" }, "<leader>ia", function()
        require("opencode").ask("@this: ")
      end, { desc = "Ask OpenCode" })

      -- Open the OpenCode action and prompt selector.
      vim.keymap.set({ "n", "x" }, "<leader>is", function()
        require("opencode").select()
      end, { desc = "OpenCode actions" })

      -- Send a motion or visual selection to OpenCode.
      vim.keymap.set({ "n", "x" }, "goi", function()
        return require("opencode").operator("@this")
      end, { expr = true, desc = "Send to OpenCode" })

      -- Send the current line.
      vim.keymap.set("n", "goo", function()
        return require("opencode").operator("@this") .. "_"
      end, { expr = true, desc = "Send line to OpenCode" })
    end,
  },
}
