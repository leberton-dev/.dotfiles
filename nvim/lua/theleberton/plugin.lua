vim.pack.add({
	{ src = 'https://github.com/rose-pine/neovim' },
	{ src = 'https://github.com/folke/tokyonight.nvim' },
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/folke/which-key.nvim' },
	{ src = 'https://github.com/pablopunk/todo.nvim' },

	-- Telescope
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },

	-- Harpoon
	{ src = 'https://github.com/theprimeagen/harpoon' },

	-- Git
	{ src = 'git@github.com:lewis6991/gitsigns.nvim.git' },
})

vim.cmd 'packadd nvim.undotree'

vim.cmd 'colorscheme tokyonight'

require('oil').setup()
require('which-key').setup()
require('todo').setup()

local themes = require('telescope.themes')
require('telescope').setup({
	defaults = themes.get_ivy({
		layout_config = { height = 0.3 },
	}),
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'TelescopePrompt',
	callback = function()
		vim.opt_local.autocomplete = false
	end,
})
