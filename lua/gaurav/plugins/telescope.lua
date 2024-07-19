return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          "%.swp$", -- Vim swap files
          "%.un~$", -- Vim backup files
          "~$", -- Backup files
          "%.bak$", -- Backup files
          "%.d$", -- Directories
          "%.log$", -- Log files
          "%.cache$", -- Cache directories
          "%.min%.%a+", -- Minified files
          "%.bundle%.%a+", -- Bundled files
          "node_modules", -- Node modules
          "%.o$", -- Object files
          "%.out$", -- Executable output files
          "%.exe$", -- Executable files
          "%.dll$", -- Dynamic-link library files
          "%.so$", -- Shared object files
          "%.dylib$", -- macOS dynamic library files
          "%.a$", -- Archive files
          "%.lib$", -- Library files
          "%.png$", -- Image files
          "%.jpg$", -- Image files
          "%.jpeg$", -- Image files
          "%.gif$", -- Image files
          "%.svg$", -- Image files
          "%.bmp$", -- Image files
          "%.ico$", -- Icon files
          "%.lock$", -- Lock files
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            -- This ensures .env files are not ignored specifically in find_files picker
            --find_command = { "rg", "--files", "--hidden", "--glob", "!.env" },
          },
        },
        path_display = { "smart" },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-x>"] = actions.select_horizontal, -- open in horizontal split
            ["<C-v>"] = actions.select_vertical, -- open in vertical split
            ["<C-t>"] = actions.select_tab, -- open in new tab
          },
          n = {
            ["<C-x>"] = actions.select_horizontal, -- open in horizontal split
            ["<C-v>"] = actions.select_vertical, -- open in vertical split
            ["<C-t>"] = actions.select_tab, -- open in new tab
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope git_branches<cr>", { desc = "Switch Branches in current cwd" })
  end,
}
