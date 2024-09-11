return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- your configuration comes here
    triggers_blacklist = {
      n = { "<C-w>" }, -- Disable which-key popup for <C-w> in normal mode
    },
    -- Custom keybindings
    setup = function()
      -- Bind <C-A-w> to trigger which-key
      vim.api.nvim_set_keymap("n", "<C-A-w>", ":WhichKey<CR>", { noremap = true, silent = true })
    end,
  },
}
