return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",

    build = ":UpdateRemotePlugins",

    dependencies = {
      "3rd/image.nvim",
    },

    init = function()
      vim.g.molten_image_provider = "image.nvim"
    end,
  },
}
