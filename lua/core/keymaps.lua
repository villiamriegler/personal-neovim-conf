local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- Faster exiting insert mode
keymap("i", "jk", "<ESC>", { silent = true })

-- Line navigation
keymap("n", "<Leader>l", "$", { silent = true })
keymap("v", "<Leader>l", "$", { silent = true })
keymap("n", "<Leader>h", "0", { silent = true })
keymap("v", "<Leader>h", "0", { silent = true })

-- Cycle splits
keymap("n", "<tab>", "<C-w><C-w>", { silent = true })
-- Remap <c-w> to more comfortable
keymap("n", "<Leader>w", "<C-w>", { silent = true })

-- Keep selection when indenting
keymap("v", ">", ">gv", { silent = true, noremap = true })
keymap("v", "<", "<gv", { silent = true, noremap = true })

-- Moving text
keymap("n", "<C-k>", ":m -2<Cr>", { silent = true })
keymap("n", "<C-j>", ":m +1<Cr>", { silent = true })
keymap("v", "<C-k>", ":m '<-2<Cr>gv=gv", { silent = true })
keymap("v", "<C-j>", ":m '>+1<Cr>gv=gv", { silent = true })

-- ********************
-- Shortcut keybindings
-- ********************
-- Netrew
keymap("n", "<A-g>", ":Ex<Cr>", { silent = true })

-- Normie save
keymap("", "<C-s>", ":w<Cr>", { silent = true })

-- Splits
keymap("n", "<A-v>", ":vsplit ", {})
keymap("n", "<A-h>", ":split ", {})

-- Buffers
keymap("n", "<Leader>n", ":bnext<Cr>", { silent = true })
keymap("n", "<Leader>p", ":bprevious<Cr>", { silent = true })

-- ********************
-- Toggle options
-- ********************
keymap("n", "tt", ":FloatermNew<Cr>", { silent = true })

-- ********************
-- Toggle options
-- ********************
keymap("n", "cs", ":set invspell<Cr>", { silent = true })

-- ********************
--	Telescope
-- ********************
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<A-f>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- ********************
-- Lsp keybindings
-- ********************
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		-- Lsp goto keymaps
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)     -- Goto declaration
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)      -- Goto defenition
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)  -- Goto implementation
		-- Lsp informational hints
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts) -- type definition
		-- Edit workspace
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		-- Suggested actions by lsp
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		-- Show all references to a symbol
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		-- Format buffer
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})
