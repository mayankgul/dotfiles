local M = {}

local backlink_buf = nil
local backlink_win = nil

local current_note_buf = nil
local backlink_paths = {}

local function setup_highlights()
  local colors = require("utils.colors")

  vim.api.nvim_set_hl(0, "ObsidianBacklinksHeader", {
    fg = colors.yellow,
    bold = true,
  })

  vim.api.nvim_set_hl(0, "ObsidianBacklinksNote", {
    fg = colors.strong_fg,
    bold = true,
  })

  vim.api.nvim_set_hl(0, "ObsidianBacklinksIcon", {
    fg = colors.blue,
  })

  vim.api.nvim_set_hl(0, "ObsidianBacklinksSnippet", {
    fg = colors.gray,
    italic = true,
  })

  vim.api.nvim_set_hl(0, "ObsidianBacklinksMuted", {
    fg = colors.gray,
    italic = true,
  })

  vim.api.nvim_set_hl(0, "ObsidianBacklinksSeparator", {
    fg = colors.border,
  })
end

local function is_valid_win()
  return backlink_win ~= nil and vim.api.nvim_win_is_valid(backlink_win)
end

local function is_valid_buf()
  return backlink_buf ~= nil and vim.api.nvim_buf_is_valid(backlink_buf)
end

local function close()
  if is_valid_win() then
    vim.api.nvim_win_close(backlink_win, true)
  end

  backlink_win = nil
end

local function get_filename(path)
  path = tostring(path)

  local filename = path:match("([^/]+)$") or path

  return filename:gsub("%.md$", "")
end

local function clean_text(text)
  if not text then
    return ""
  end

  text = tostring(text)
  text = text:gsub("%s+", " ")
  text = text:gsub("^%s+", "")
  text = text:gsub("%s+$", "")

  return text
end

local function truncate(text, max_length)
  text = clean_text(text)

  if #text <= max_length then
    return text
  end

  return text:sub(1, max_length - 3) .. "..."
end

local function create_buffer()
  if is_valid_buf() then
    return backlink_buf
  end

  backlink_buf = vim.api.nvim_create_buf(false, true)

  vim.bo[backlink_buf].buftype = "nofile"
  vim.bo[backlink_buf].bufhidden = "wipe"
  vim.bo[backlink_buf].swapfile = false
  vim.bo[backlink_buf].modifiable = false
  vim.bo[backlink_buf].filetype = "obsidian_backlinks"

  return backlink_buf
end

local function open_window()
  if is_valid_win() then
    return backlink_win
  end

  local source_win = vim.api.nvim_get_current_win()

  local height = 8

  backlink_win = vim.api.nvim_open_win(create_buffer(), true, {
    win = source_win,
    split = "below",
    height = height,
  })

  vim.wo[backlink_win].number = false
  vim.wo[backlink_win].relativenumber = false
  vim.wo[backlink_win].signcolumn = "no"
  vim.wo[backlink_win].foldcolumn = "0"
  vim.wo[backlink_win].cursorline = true
  vim.wo[backlink_win].wrap = true
  vim.wo[backlink_win].spell = false

  vim.wo[backlink_win].winhl = table.concat({
    "Normal:Normal",
    "NormalNC:Normal",
    "CursorLine:CursorLine",
    "EndOfBuffer:Normal",
  }, ",")

  return backlink_win
end

local function open_note(path)
  if not path or path == "" then
    return
  end

  close()

  local source = current_note_buf

  if source and vim.api.nvim_buf_is_valid(source) then
    local source_win = nil

    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == source then
        source_win = win
        break
      end
    end

    if source_win then
      vim.api.nvim_set_current_win(source_win)
    end
  end

  vim.cmd("edit " .. vim.fn.fnameescape(path))
end

local function setup_keymaps(bufnr)
  vim.keymap.set("n", "<CR>", function()
    local line = vim.api.nvim_win_get_cursor(0)[1]
    local path = backlink_paths[line]

    if path then
      open_note(path)
    end
  end, {
    buffer = bufnr,
    desc = "Open backlink",
  })

  vim.keymap.set("n", "q", function()
    close()

    if current_note_buf and vim.api.nvim_buf_is_valid(current_note_buf) then
      vim.api.nvim_set_current_buf(current_note_buf)
    end
  end, {
    buffer = bufnr,
    desc = "Close backlinks",
  })

  vim.keymap.set("n", "<Esc>", function()
    close()

    if current_note_buf and vim.api.nvim_buf_is_valid(current_note_buf) then
      vim.api.nvim_set_current_buf(current_note_buf)
    end
  end, {
    buffer = bufnr,
    desc = "Close backlinks",
  })

  vim.keymap.set("n", "o", function()
    local line = vim.api.nvim_win_get_cursor(0)[1]
    local path = backlink_paths[line]

    if path then
      open_note(path)
    end
  end, {
    buffer = bufnr,
    desc = "Open backlink",
  })
end

local function render(backlinks)
  if not is_valid_buf() then
    return
  end

  backlink_paths = {}

  local lines = {}

  table.insert(lines, "")
  table.insert(lines, "󰌷  BACKLINKS")
  table.insert(
    lines,
    "──────────────────────────────────────────────────"
  )

  if not backlinks or #backlinks == 0 then
    table.insert(lines, "")
    table.insert(lines, "   No notes link to this note.")
  else
    table.insert(lines, "")

    for _, backlink in ipairs(backlinks) do
      local path = tostring(backlink.path)
      local filename = get_filename(path)

      table.insert(lines, "   󰁕  " .. filename)

      backlink_paths[#lines] = path

      if backlink.matches and #backlink.matches > 0 then
        local match = backlink.matches[1]

        local text = truncate(match.text or "", 100)

        if text ~= "" then
          table.insert(lines, "      " .. text)
        end
      end

      table.insert(lines, "")
    end
  end

  vim.bo[backlink_buf].modifiable = true

  vim.api.nvim_buf_set_lines(backlink_buf, 0, -1, false, lines)

  vim.bo[backlink_buf].modifiable = false

  if is_valid_win() then
    vim.api.nvim_win_set_cursor(backlink_win, { 1, 0 })
  end
end

function M.refresh(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end

  local ok, obsidian = pcall(require, "obsidian")

  if not ok then
    return
  end

  local client = obsidian.get_client()

  if not client then
    return
  end

  local note = client:current_note(bufnr)

  if not note then
    return
  end

  current_note_buf = bufnr

  client:find_backlinks_async(note, function(backlinks)
    vim.schedule(function()
      if current_note_buf ~= bufnr then
        return
      end

      if not vim.api.nvim_buf_is_valid(bufnr) then
        return
      end

      if not is_valid_win() then
        return
      end

      render(backlinks or {})
    end)
  end, {
    search = {
      sort = true,
    },
  })
end

function M.toggle()
  if is_valid_win() then
    close()

    if current_note_buf and vim.api.nvim_buf_is_valid(current_note_buf) then
      vim.api.nvim_set_current_buf(current_note_buf)
    end

    return
  end

  local current = vim.api.nvim_get_current_buf()

  current_note_buf = current

  open_window()
  setup_keymaps(backlink_buf)
  M.refresh(current)
end

function M.open()
  if not is_valid_win() then
    local current = vim.api.nvim_get_current_buf()

    current_note_buf = current

    open_window()
    setup_keymaps(backlink_buf)
  end

  M.refresh(current_note_buf)
end

function M.setup()
  setup_highlights()

  vim.api.nvim_create_user_command("ObsidianBacklinksFooter", function()
    M.toggle()
  end, {
    desc = "Toggle Obsidian backlinks",
  })

  local group = vim.api.nvim_create_augroup("obsidian_backlinks_footer", { clear = true })

  vim.api.nvim_create_autocmd("BufEnter", {
    group = group,
    pattern = "*.md",
    callback = function(args)
      if is_valid_win() then
        M.refresh(args.buf)
      end
    end,
  })

  vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    pattern = "*.md",
    callback = function(args)
      if is_valid_win() then
        M.refresh(args.buf)
      end
    end,
  })

  vim.api.nvim_create_autocmd("BufLeave", {
    group = group,
    callback = function(args)
      if args.buf == backlink_buf then
        return
      end
    end,
  })

  vim.api.nvim_create_autocmd("ColorScheme", {
    group = group,
    callback = setup_highlights,
  })

  vim.api.nvim_create_autocmd("BufWipeout", {
    group = group,
    callback = function(args)
      if args.buf == backlink_buf then
        backlink_buf = nil
        backlink_win = nil
      end
    end,
  })

  vim.keymap.set("n", "<leader>ob", function()
    M.toggle()
  end, {
    desc = "Toggle Obsidian Backlinks",
  })
end

return M
