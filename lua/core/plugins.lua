-- Automatically sync packer when updating this file (https://github.com/wbthomason/packer.nvim#quickstart:~:text=look%20like%20this-,%3A,-vim.cmd)
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'mbbill/undotree'

    use {
        "FabijanZulj/blame.nvim",
        config = function()
            require('blame').setup {}
        end
    }

    -- Auto pairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Colortheme
    -- use "savq/melange-nvim"
    use 'AlexvZyl/nordic.nvim'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }


    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- lsp
    use {
        'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client use 'hrsh7th/nvim-cmp', 				-- Autocompletion plugin
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
        'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
        'L3MON4D3/LuaSnip',         -- Snippets plugin
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim'
    }
    -- Float term
    use 'voldikss/vim-floaterm'

    -- nvim v0.7.2
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })

    -- Which key i ain't ashamed
    use {
        "folke/which-key.nvim",
        config = function() require("which-key").setup {} end
    }
end)
