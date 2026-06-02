local M = {}

local _trouble = function()
	vim.pack.add({
		{ src = "https://github.com/folke/trouble.nvim" }
	})
	require("trouble").setup()

	local keys = vim.keymap
	keys.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
	keys.set("n", "<leader>xs", "<cmd>Trouble symbols toggle<CR>", { desc = "Symbols (Trouble)" })
	keys.set("n", "<leader>xl", "<cmd>Trouble lsp toggle<CR>", { desc = "LSP refs/defs (Trouble)" })
	keys.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix (Trouble)" })
end

M.setup = function()
	_trouble()
end

return M
