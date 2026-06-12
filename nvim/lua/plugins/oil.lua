return {
	src = "https://github.com/stevearc/oil.nvim",
	deps = {
		{ src = "https://github.com/refractalize/oil-git-status.nvim" },
		{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	},
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
			},
			win_options = {
				signcolumn = "yes:2",
			},
			keymaps = {
				["q"] = "actions.close",
				["<C-c>"] = "actions.close",
			},
		})
		vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open Oil" })
	end,
}
