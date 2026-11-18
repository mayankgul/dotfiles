return {
  pretty_filename = function()
    local filename = vim.fn.expand("%:t")

    if filename == "" then
      return "[No Name]"
    end

    local icon, icon_hl = require("nvim-web-devicons").get_icon(filename, vim.fn.expand("%:e"), { default = true })

    if not icon then
      icon = ""
      icon_hl = "Normal"
    end

    local modified = ""
    if vim.bo.modified then
      modified = " %#LualineModified#●%*"
    end

    local readonly = ""
    if vim.bo.readonly then
      readonly = " %#LualineReadonly#%*"
    end

    return string.format("%%#%s#%s%%* %s%s%s", icon_hl, icon, filename, modified, readonly)
  end,

  recording_macro = function()
    local reg = vim.fn.reg_recording()

    if reg == "" then
      return ""
    end

    return "󰑋 @" .. reg
  end,

  search_result = function()
    if vim.v.hlsearch == 0 then
      return ""
    end

    local ok, result = pcall(vim.fn.searchcount, {
      recompute = 0,
      maxcount = 999,
    })

    if not ok or result.total == 0 then
      return ""
    end

    return string.format(" %d/%d", result.current, result.total)
  end,
}
