local brew_prefix = vim.fn.trim(vim.fn.system("brew --prefix"))

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--header-insertion=iwyu",

            -- Allow clangd to query Homebrew GCC
            "--query-driver=" .. brew_prefix .. "/bin/g++-*",
          },
        },
      },
    },
  },
}
