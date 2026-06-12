return {
	src = "https://github.com/folke/trouble.nvim",
	config = function()
		require("trouble").setup()
		local map = vim.keymap.set
		map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
		map("n", "<leader>xs", "<cmd>Trouble symbols toggle<CR>", { desc = "Symbols (Trouble)" })
		map("n", "<leader>xl", "<cmd>Trouble lsp toggle<CR>", { desc = "LSP refs/defs (Trouble)" })
		map("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix (Trouble)" })
	end,
}
