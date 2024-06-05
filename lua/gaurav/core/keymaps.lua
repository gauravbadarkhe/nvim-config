vim.g.mapleader = " "

local keymap = vim.keymap -- for concisensess

keymap.set("i", "jk", "<esc>", { desc = "exist insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<cr>", { desc = "clear search  highlights" })

-- increment / decrement numbers
keymap.set("n", "<leader>+", "<c-a>", { desc = "increment number" })
keymap.set("n", "<leader>-", "<c-x>", { desc = "decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<c-w>v", { desc = "split window vertically" })
keymap.set("n", "<leader>sh", "<c-w>s", { desc = "split window horizontally" })
keymap.set("n", "<leader>se", "<c-w>=", { desc = "make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<cr>", { desc = "close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "goto next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "goto previouse tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<cr>", { desc = "open current buffer in new tab" }) --  move current buffer to new tab

-- Move current line up
keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
-- Move current line down
keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- Move selected lines up
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- Move selected lines down
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
