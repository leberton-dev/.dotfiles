vim.pack.add({
	{ src = 'https://github.com/rose-pine/neovim' },
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/folke/which-key.nvim' },
})

vim.cmd 'packadd nvim.undotree'

vim.cmd 'colorscheme rose-pine'

require('oil').setup()
require('which-key').setup()

