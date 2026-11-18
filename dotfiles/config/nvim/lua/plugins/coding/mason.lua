return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    automatic_enable = {
      exclude = {
        "tsserver",
        "rust_analyzer",
        "copilot",
        "jdtls",
        "stylua",
        "tsgo",
        "ts_ls",
        "bacon_ls",
        "basedpyright",
        "ruff_lsp",

        -- Disable unwanted Python servers
        "pylsp",
        "pylyzer",
        "pyrefly",
      },
    },
  },
}
