vim.pack.add({
	{ src = 'https://github.com/rose-pine/neovim' },
	{ src = 'https://github.com/folke/tokyonight.nvim' },
	{ src = 'https://github.com/jacoborus/tender.vim' },
	{ src = 'https://github.com/webhooked/kanso.nvim' },

	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/folke/which-key.nvim' },
	{ src = 'https://github.com/pablopunk/todo.nvim' },

	-- blink cmp
	{
		src = 'https://github.com/saghen/blink.cmp',
		version = vim.version.range('1.*')
	},

	-- TreeSitter
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },

	-- Oil
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/refractalize/oil-git-status.nvim',        config = true },

	-- Telescope
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },

	-- Harpoon
	{ src = 'https://github.com/theprimeagen/harpoon' },

	-- Git
	{ src = 'git@github.com:lewis6991/gitsigns.nvim.git' },

	-- Markdown view
	{ src = 'https://github.com/OXY2DEV/markview.nvim' },

	-- hlslens ( better glance at matched informations )
	{ src = 'https://github.com/kevinhwang91/nvim-hlslens' },

	-- autopairs
	{ src = 'https://github.com/windwp/nvim-autopairs' },

	-- tabout (tabout from parentheses, quotes, and similar context)
	{ src = 'https://github.com/abecodes/tabout.nvim' },

	-- Sessions
	{ src = 'https://github.com/folke/persistence.nvim' },

	-- Tasks (make)
	{ src = 'https://github.com/stevearc/overseer.nvim' },

	-- UI
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons' },
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },
	{ src = 'https://github.com/rachartier/tiny-inline-diagnostic.nvim' },
	{ src = 'https://github.com/karb94/neoscroll.nvim' },
	{ src = 'https://github.com/sphamba/smear-cursor.nvim' },
})

vim.cmd 'packadd nvim.undotree'
vim.cmd 'packadd! termdebug'
vim.cmd 'colorscheme kanso-zen'

require('oil').setup({
	win_options = {
		signcolumn = "yes:2",
	}
})
require('oil-git-status').setup()

require('which-key').setup()
require('todo').setup()

require('nvim-autopairs').setup()
require('hlslens').setup()
require('tabout').setup()
