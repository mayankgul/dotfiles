return {
  name = "C++: Build Current File",
  desc = "Compile current C++ file using g++-16 and C++20",

  builder = function()
    local file = vim.fn.expand("%:p")

    if file == "" then
      error("No file is currently open")
    end

    -- Save the current buffer before compiling
    vim.cmd("write")

    -- Generate executable alongside the source file
    local output = vim.fn.expand("%:p:r")

    return {
      cmd = { "g++-16" },

      args = {
        "-std=c++20",
        "-O2",
        "-pipe",
        "-Wall",
        "-Wextra",
        "-Wshadow",
        file,
        "-o",
        output,
      },

      cwd = vim.fn.expand("%:p:h"),

      components = {
        {
          "on_output_quickfix",
          open = true,
        },
        "default",
      },
    }
  end,

  condition = {
    filetype = { "cpp" },
  },
}
