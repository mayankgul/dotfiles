return {
  {
    "FrancescoDerme/tuna.nvim",

    opts = {
      -- C++ compilation
      compile_command = {
        cpp = {
          exec = "g++-16",
          args = {
            "-std=c++20",
            "-O2",
            "-Wall",
            "-Wextra",
            "$(FNAME)",
            "-o",
            "$(FNOEXT)",
          },
        },
      },

      -- Maximum execution time in milliseconds
      maximum_time = 3000,

      -- Template for downloaded problems
      template_file = {
        cpp = "~/Documents/Code/dsa/codeforces/template.cpp",
      },

      -- Template for :Tuna scaffold solution
      scaffold = {
        templates = {
          solution = "~/Documents/Code/dsa/codeforces/template.cpp",
        },
      },

      template_cursor = {
        cpp = {
          pattern = "void solve() {",
          offset = 0,
        },
      },

      -- Individual problem downloads
      downloaded_problems_path = "$(HOME)/Documents/Code/dsa/codeforces/practice/unrated/$(PROBLEM)/main.$(FEXT)",

      -- Complete contest downloads
      downloaded_contests_directory = "$(HOME)/Documents/Code/dsa/codeforces/contests/$(JUDGE)/$(CONTEST)",

      -- Testcases
      testcases_directory = "testcases",

      -- Store testcases inside each problem directory
      testcases_directory = "testcases",

      -- Keybinding prefix
      keymaps = {
        preset = "<leader>t",
      },
    },
  },
}
