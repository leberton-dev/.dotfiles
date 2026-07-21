return {
	src = "https://github.com/nvim-telescope/telescope.nvim",
	deps = {
		{ src = "https://github.com/nvim-lua/plenary.nvim" },
		{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	},
	config = function()
		require("telescope").setup()
		require("telescope").load_extension("fzf")
		-- vim.keymap.set("n", "<C-f>", "<cmd>Telescope find_files<CR>")
		-- vim.keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<CR>")
		vim.keymap.set("n", "<C-s>", "<cmd>Telescope grep_string<CR>")
	end,
}
