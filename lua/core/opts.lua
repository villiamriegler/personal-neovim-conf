local opt = vim.opt

-- Mouse
opt.mouse = 'a'

-- Tabs and indents
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.autoindent = true

-- Text display
opt.scrolloff = 8
opt.wrap = false
opt.number = true
opt.relativenumber = true
opt.redrawtime = 1000

-- search options
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Highlighting
opt.hlsearch = true
opt.spelllang = en, sv

-- splitting
opt.splitbelow = true

-- Saving
opt.confirm = true

opt.conceallevel=1

require('catppuccin').setup({
  flavour = 'frappe'
})

-- Color Theme
vim.cmd.colorscheme 'catppuccin'



