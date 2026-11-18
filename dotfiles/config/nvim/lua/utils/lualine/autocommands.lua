vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    require("lualine").refresh()
  end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    vim.defer_fn(function()
      require("lualine").refresh()
    end, 50)
  end,
})

vim.api.nvim_create_autocmd({ "CmdlineLeave", "CursorMoved" }, {
  callback = function()
    require("lualine").refresh()
  end,
})
