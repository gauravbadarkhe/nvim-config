return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    -- Load telescope and its extensions
    local telescope = require("telescope")
    local fb_actions = require("telescope").extensions.file_browser.actions

    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "🔍 ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
        file_ignore_patterns = { ".*~" }, -- Ignore files with ~
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "━", "│", "━", "│", "┏", "┓", "┛", "┗" }, -- Proper border chars
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" }, -- Custom find_command using fd
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
          hidden = true, -- Show hidden files in the file browser
          mappings = {
            ["i"] = {
              ["<C-h>"] = fb_actions.goto_parent_dir,
              ["<C-l>"] = fb_actions.change_cwd,
            },
            ["n"] = {
              ["<C-h>"] = fb_actions.goto_parent_dir,
              ["<C-l>"] = fb_actions.change_cwd,
            },
          },
        },
      },
    })
    telescope.load_extension("file_browser")

    -- Set keymaps for Telescope commands
    local keymap = vim.keymap -- for conciseness

    -- Key mappings for file browser
    keymap.set("n", "<leader>ee", "<cmd>Telescope file_browser<CR>", { desc = "Open file explorer" })
    keymap.set("n", "<leader>ec", "<cmd>Telescope file_browser close<CR>", { desc = "Close file explorer" })
    keymap.set("n", "<leader>er", "<cmd>Telescope file_browser<CR>", { desc = "Refresh file explorer" })
    keymap.set(
      "n",
      "<leader>ef",
      "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
      { desc = "Toggle file explorer on current file" }
    )

    -- Function to open Telescope file browser in a floating window
    local function open_telescope_file_browser()
      require("telescope").extensions.file_browser.file_browser({
        cwd = vim.fn.getcwd(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = {
          width = 0.8,
          height = 0.8,
          preview_cutoff = 120,
          prompt_position = "top",
        },
      })
    end

    -- Autocommand to open Telescope file browser when starting Neovim with an empty buffer or directory
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- Only open file explorer if no file is specified
        if vim.fn.argc() == 0 then
          open_telescope_file_browser()
        end
      end,
    })
  end,
}
