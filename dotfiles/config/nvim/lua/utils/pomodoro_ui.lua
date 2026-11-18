local M = {}

local namespace = vim.api.nvim_create_namespace("minimal_pomodoro_ui")

local partial_blocks = {
  "",
  "▏",
  "▎",
  "▍",
  "▌",
  "▋",
  "▊",
  "▉",
}

local function display_width(text)
  return vim.fn.strdisplaywidth(text)
end

local function center(text, width)
  local available = math.max(0, width - display_width(text))
  local left_padding = math.floor(available / 2)

  return string.rep(" ", left_padding) .. text
end

local function make_progress(ratio, width)
  ratio = math.max(0, math.min(1, ratio))

  local exact = ratio * width
  local full_blocks = math.floor(exact)
  local fraction = exact - full_blocks
  local partial_index = math.floor(fraction * 8)

  local partial = partial_blocks[partial_index + 1]

  local partial_width = partial ~= "" and 1 or 0
  local empty_blocks = math.max(0, width - full_blocks - partial_width)

  local filled = string.rep("█", full_blocks) .. partial

  local empty = string.rep("░", empty_blocks)

  return filled, empty
end

local function apply_highlights()
  local colors = require("utils.colors")

  vim.api.nvim_set_hl(0, "PomodoroNormal", {
    fg = colors.fg,
    bg = colors.dark,
  })

  vim.api.nvim_set_hl(0, "PomodoroBorder", {
    fg = colors.border,
    bg = colors.dark,
  })

  vim.api.nvim_set_hl(0, "PomodoroTitle", {
    fg = colors.yellow,
    bg = colors.dark,
    bold = true,
  })

  vim.api.nvim_set_hl(0, "PomodoroWork", {
    fg = colors.green,
    bg = colors.dark,
    bold = true,
  })

  vim.api.nvim_set_hl(0, "PomodoroBreak", {
    fg = colors.orange,
    bg = colors.dark,
    bold = true,
  })

  vim.api.nvim_set_hl(0, "PomodoroTime", {
    fg = colors.cyan,
    bg = colors.dark,
    bold = true,
  })

  vim.api.nvim_set_hl(0, "PomodoroProgressEmpty", {
    fg = colors.gray,
    bg = colors.dark,
  })

  vim.api.nvim_set_hl(0, "PomodoroText", {
    fg = colors.fg,
    bg = colors.dark,
  })

  vim.api.nvim_set_hl(0, "PomodoroMuted", {
    fg = colors.gray,
    bg = colors.dark,
  })
end

function M.setup(pomodoro, options)
  options = options or {}

  local UI = require("pomodoro.ui")
  local constants = require("pomodoro.constants")
  local uv = require("pomodoro.uv")

  local Phases = constants.Phases

  local width = options.width or 30
  local top_margin = options.top or 1
  local right_margin = options.right or 2
  local border = options.border or "rounded"

  local function window_config()
    -- Keep the window usable even in a narrow terminal.
    local available_width = math.max(18, vim.o.columns - right_margin - 2)

    local current_width = math.min(width, available_width)

    return {
      relative = "editor",

      -- Place the window using its northeast corner.
      anchor = "NE",
      row = top_margin,
      col = vim.o.columns - right_margin,

      width = current_width,
      height = 3,

      border = border,
      focusable = false,
      zindex = 60,

      title = " 󰔟 Pomodoro ",
      title_pos = "left",
    }
  end

  local function set_buffer_lines(lines)
    vim.bo[UI.buffer].modifiable = true

    vim.api.nvim_buf_set_lines(UI.buffer, 0, -1, false, lines)

    vim.bo[UI.buffer].modifiable = false
  end

  local function add_highlight(group, line, start_column, end_column)
    if end_column == -1 or end_column > start_column then
      vim.api.nvim_buf_add_highlight(UI.buffer, namespace, group, line, start_column, end_column)
    end
  end

  local function render()
    if not vim.api.nvim_buf_is_valid(UI.buffer) then
      return
    end

    local current_width = UI.buffer_opts.width or width

    local inner_width = math.max(8, current_width - 4)

    local total = math.max(pomodoro.timer_duration or 0, 1)

    local elapsed = math.max(0, uv.now() - pomodoro.started_timer_time)

    local remaining = math.max(0, total - elapsed)

    local progress = math.max(0, math.min(1, elapsed / total))

    local minutes = math.floor(remaining / 60000)

    local seconds = math.floor((remaining % 60000) / 1000)

    local time_text = string.format("%02d:%02d", minutes, seconds)

    local label
    local message
    local active_highlight

    if pomodoro.phase == Phases.BREAK then
      local long_break = false

      if type(pomodoro.isInLongBreak) == "function" then
        long_break = pomodoro.isInLongBreak()
      end

      if long_break then
        label = "󰏤 Long Break"
        message = "Step away and fully reset"
      else
        label = "󰏤 Break"
        message = "Breathe, stretch and look away"
      end

      active_highlight = "PomodoroBreak"
    else
      label = "󰔟 Focus"
      message = "Deep work · one task at a time"
      active_highlight = "PomodoroWork"
    end

    local gap = math.max(1, inner_width - display_width(label) - display_width(time_text))

    local header_prefix = "  " .. label .. string.rep(" ", gap)

    local header = header_prefix .. time_text

    local filled, empty = make_progress(progress, inner_width)

    local progress_prefix = "  "

    local progress_line = progress_prefix .. filled .. empty

    local message_line = center(message, current_width)

    set_buffer_lines({
      header,
      progress_line,
      message_line,
    })

    vim.api.nvim_buf_clear_namespace(UI.buffer, namespace, 0, -1)

    -- Phase label.
    add_highlight(active_highlight, 0, 2, 2 + #label)

    -- Remaining time.
    add_highlight("PomodoroTime", 0, #header_prefix, #header_prefix + #time_text)

    -- Filled portion of progress bar.
    add_highlight(active_highlight, 1, #progress_prefix, #progress_prefix + #filled)

    -- Empty portion of progress bar.
    add_highlight("PomodoroProgressEmpty", 1, #progress_prefix + #filled, -1)

    add_highlight("PomodoroText", 2, 0, -1)

    -- Keep the Lualine timer refreshed while the popup is visible.
    vim.cmd.redrawstatus()
  end

  local function configure_window()
    if not UI.isWinOpen() then
      return
    end

    vim.wo[UI.win].winhl = table.concat({
      "Normal:PomodoroNormal",
      "NormalNC:PomodoroNormal",
      "FloatBorder:PomodoroBorder",
      "FloatTitle:PomodoroTitle",
      "EndOfBuffer:PomodoroNormal",
    }, ",")

    vim.wo[UI.win].wrap = false
    vim.wo[UI.win].cursorline = false
    vim.wo[UI.win].number = false
    vim.wo[UI.win].relativenumber = false
    vim.wo[UI.win].signcolumn = "no"
    vim.wo[UI.win].foldcolumn = "0"
    vim.wo[UI.win].winblend = 0
  end

  local function show_ui()
    if pomodoro.phase == Phases.NOT_RUNNING or pomodoro.phase == nil then
      pomodoro.start()
    end

    UI.buffer_opts = window_config()

    if not UI.isWinOpen() then
      -- false means: do not move keyboard focus into the float.
      UI.win = vim.api.nvim_open_win(UI.buffer, false, UI.buffer_opts)
    else
      pcall(vim.api.nvim_win_set_config, UI.win, UI.buffer_opts)
    end

    configure_window()
    render()
    UI.startRenderingTimer(pomodoro)
  end

  -- Replace the plugin's original render function.
  UI.updateUi = function()
    vim.schedule(function()
      if not UI.isWinOpen() then
        UI.ui_update_timer:stop()
        return
      end

      render()
      UI.startRenderingTimer(pomodoro)
    end)
  end

  -- Used internally when a break begins.
  -- This is intentionally idempotent rather than acting as a toggle.
  pomodoro.displayPomodoroUI = show_ui

  -- Keep a manually opened UI visible when a break ends or is delayed.
  -- It will still close when PomodoroStop changes the phase to NOT_RUNNING.
  pomodoro.closePomodoroUi = function()
    if pomodoro.phase == Phases.NOT_RUNNING then
      UI.close()
    end
  end

  -- Replace the original command with a proper show/hide toggle.
  pcall(vim.api.nvim_del_user_command, "PomodoroUI")

  vim.api.nvim_create_user_command("PomodoroUI", function()
    if UI.isWinOpen() then
      UI.close()
    else
      show_ui()
    end
  end, {
    desc = "Toggle the Pomodoro floating UI",
  })

  apply_highlights()

  local group = vim.api.nvim_create_augroup("minimal_pomodoro_ui", { clear = true })

  vim.api.nvim_create_autocmd("ColorScheme", {
    group = group,
    callback = apply_highlights,
  })

  -- Keep the float attached to the top-right after resizing Neovim.
  vim.api.nvim_create_autocmd("VimResized", {
    group = group,
    callback = function()
      if not UI.isWinOpen() then
        return
      end

      UI.buffer_opts = window_config()

      pcall(vim.api.nvim_win_set_config, UI.win, UI.buffer_opts)
    end,
  })
end

return M
