vim.g.mapleader = " "

local keymap = vim.keymap -- for concisensess

-- Keybinding to source init.lua
keymap.set("n", "<C-l>", ":source ~/.config/nvim/init.lua<CR>", { noremap = true, silent = true })

keymap.set("i", "jk", "<esc>", { desc = "exist insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<cr>", { desc = "clear search  highlights" })

vim.api.nvim_set_keymap("n", "<Space>lf", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })

-- Switch between panes

-- Remap <C-h> for window navigation

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-h>", "<C-w>h", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true }) -- increment / decrement numbers

keymap.set("n", "<leader>+", "<c-a>", { desc = "increment number" })
keymap.set("n", "<leader>-", "<c-x>", { desc = "decrement number" })

-- Use Tab to indent
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

-- Use Tab for inserting spaces in insert mode
vim.api.nvim_set_keymap("i", "<Tab>", "<C-t>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true })

-- window management
keymap.set("n", "<leader>sv", "<c-w>v", { desc = "split window vertically" })
keymap.set("n", "<leader>sh", "<c-w>s", { desc = "split window horizontally" })
keymap.set("n", "<leader>se", "<c-w>=", { desc = "make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<cr>", { desc = "close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "pen new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "goto next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "goto previouse tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<cr>", { desc = "pen current buffer in new tab" }) --  move current buffer to new tab

-- Move current line up
keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
-- Move current line down
keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- Move selected lines up
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Move selected lines down
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
--
---- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])
--
---- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])
--
keymap.set({ "n", "v" }, "<leader>d", [["_d]])
--
---- This is going to get me cancelled
-- keymap.set("i", "<C-c>", "<Esc>")
--
keymap.set("n", "Q", "<nop>")
keymap.set("n", "<leader>f", vim.lsp.buf.format)
--keymap.set("n", "<C-s>", "<cmd>!tmux neww tmux-sessionizer<CR>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Map <leader>xx to make the current file executable
keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("n", "<C-d>", "<cmd>:bd<CR>")
