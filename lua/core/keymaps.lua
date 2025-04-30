local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("n", "<Leader>lg", ":LazyGit<Cr>", { silent = true, desc = "Open lazygit" })

-- Faster exiting insert mode
keymap("i", "jk", "<ESC>", { silent = true, desc = "Exit insert mode" })

-- Line navigation
keymap("n", "<Leader>a", "$", { silent = true, desc = "Goto end of line" })
keymap("v", "<Leader>a", "$", { silent = true, desc = "Goto end of line" })

-- Moving text
keymap("n", "<C-k>", ":m -2<Cr>", { silent = true, desc = "Move line upwards" })
keymap("n", "<C-j>", ":m +1<Cr>", { silent = true, desc = "Move line downwards" })
keymap("v", "<C-k>", ":m '<-2<Cr>gv=gv", { silent = true, desc = "Move selection upwards" })
keymap("v", "<C-j>", ":m '>+1<Cr>gv=gv", { silent = true, desc = "Move selection downwards" })

-- Keep selection when indenting
keymap("v", ">", ">gv", { silent = true, noremap = true, desc = "Indent" })
keymap("v", "<", "<gv", { silent = true, noremap = true, desc = "Unindent" })

keymap("n", "<Leader>gb", ":BlameToggle virtual<Cr>", {silent = true, noremap = true, desc = "Toggle git blame"})
keymap("n", "<Leader>gbw", ":BlameToggle <Cr>", {silent = true, noremap = true, desc = "Toggle git blame (window mode)"})
-- ********************
-- Shortcut keybindings
-- ********************

-- Netrew
keymap("n", "<A-g>", ":Ex<Cr>", { silent = true, desc = "Open Netrew" })

-- Undotree
keymap("n", "<Leader>U", ":UndotreeToggle<Cr>", { silent = true, desc = "Toggle Undotree" })

-- Normie save
keymap("", "<C-s>", ":w<Cr>", { silent = true, desc = "Save file" })

-- Splits
keymap("n", "<Leader>s", ":vsplit<Cr>", { desc = "Split window" })
keymap("n", "<Leader>hs", ":split<Cr>", { desc = "Horisontal split" })
-- Cycle splits
keymap("n", "<tab>", "<C-w><C-w>", { silent = true, desc = "Cyckle splits" })
-- Remap <c-w> to more comfortable
keymap("n", "<Leader><tab>", "<C-w>", { remap = true, silent = true, desc = "Choose split" })

-- Buffers
keymap("n", "<Leader>n", ":bnext<Cr>", { silent = true, desc = "Next buffer" })
keymap("n", "<Leader>p", ":bprevious<Cr>", { silent = true, desc = "Previous buffer" })

-- ********************
-- Toggle options
-- ********************
keymap("n", "tt", ":FloatermNew<Cr>", { silent = true, desc = "Open floatterm" })
keymap("n", "te", ":FloatermKill<Cr>", { silent = true, desc = "Close floatterm" })

-- ********************
-- Toggle options
-- ********************
keymap("n", "cs", ":set invspell<Cr>", { silent = true })

-- ********************
--	Telescope
-- ********************
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope help" })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "Telescope help commands" })

-- ********************
-- Lsp keybindings
-- ********************
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Lsp goto keymaps
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Goto decalaration" })    -- Goto declaration
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "Goto defenition" })       -- Goto defenition
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Goto implementation" }) -- Goto implementation
		-- Lsp informational hints
		vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Type defenition" }) -- type definition
		-- Edit workspace
		vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = "Add directory" })
		vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder,
			{ buffer = ev.buf, desc = "Remove directory" })

		vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename file" })
		-- Suggested actions by lsp
		vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code actions" })
		-- Show all references to a symbol
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = "Show all references" })

		vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, { buffer = ev.buf, desc = "Open diagnostic float" })
		-- Format buffer
		vim.keymap.set('n', '<Leader>f', function()
			vim.lsp.buf.format { async = true }
		end, { buffer = ev.buf, desc = "Format file" })
	end,
})
