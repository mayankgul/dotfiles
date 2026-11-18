return {
  "pwntester/octo.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
    "nvim-tree/nvim-web-devicons",
  },

  cmd = "Octo",

  opts = {
    default_remote = { "origin" },
  },

  keys = {
    { "<leader>gi", "<cmd>Octo issue list<CR>", desc = "GitHub Issues" },
    { "<leader>gp", "<cmd>Octo pr list<CR>", desc = "GitHub Pull Requests" },
    { "<leader>gr", "<cmd>Octo review start<CR>", desc = "Start Review" },
    { "<leader>gn", "<cmd>Octo notification list<CR>", desc = "Notifications" },
  },
}
