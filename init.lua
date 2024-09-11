require("gaurav.core")
require("gaurav.lazy")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`

-- Remove the existing <Space>f mapping in normal mode
vim.api.nvim_del_keymap("n", "<Space>f")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  desc = "Change cursor shape in insert mode",
  callback = function()
    vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  desc = "Change cursor shape back to block in normal mode",
  callback = function()
    vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Disable auto-commenting on new lines",
  callback = function()
    vim.opt.formatoptions:remove("o")
  end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = "/,?",
  desc = "Highlight search results temporarily",
  callback = function()
    vim.opt.hlsearch = true
  end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  pattern = "/,?",
  desc = "Disable search highlight after searching",
  callback = function()
    vim.opt.hlsearch = false
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.ejs",
  command = "set filetype=html",
})
