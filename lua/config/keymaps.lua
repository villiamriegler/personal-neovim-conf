local keymap = vim.keymap.set

keymap("i", "jk", "<ESC>", { silent = true, desc = "Exit insert mode" })
keymap("n", "<TAB>", "<C-w><C-w>", { silent = true, desc = "Cycle splits" })
keymap("n", "<A-g>", ":Ex<Cr>", { silent = true, desc = "Open netrw" })
