return {
	src = "https://github.com/zaldih/themery.nvim",
	deps = {
		{ src = "https://github.com/olimorris/onedarkpro.nvim",     name = "onedarkpro" },
		{ src = "https://github.com/catppuccin/nvim.git",           name = "catppuccin" },
		{ src = "https://github.com/rebelot/kanagawa.nvim",         name = "kanagawa" },
		{ src = "https://github.com/ellisonleao/gruvbox.nvim",      name = "gruvbox" },
		{ src = "https://github.com/shaunsingh/nord.nvim",          name = "nord" },
		{ src = "https://github.com/folke/tokyonight.nvim",         name = "tokyonight" },
		{ src = "https://github.com/Mofiqul/dracula.nvim",          name = "dracula" },
		{ src = "https://github.com/rose-pine/neovim",              name = "rose-pine" },
		{ src = "https://github.com/blazkowolf/gruber-darker.nvim", name = "gruber-darker" },
	},
	config = function()
		require("themery").setup({
			themes = vim.fn.getcompletion("", "color"),
		})
	end,
}
