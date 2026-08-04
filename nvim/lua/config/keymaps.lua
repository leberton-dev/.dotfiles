local map = vim.keymap.set

map("n", "<leader><leader>x", "<cmd> source %<CR>", { desc = "Source current file" })
map("v", ">", ">gv", { desc = "Indent selected text to the right" })
map("v", "<", "<gv", { desc = "Indent selected text to the left" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostics" })

-- reopen quickfix window after closing it
map("n", "<leader>q", function()
	vim.cmd("copen")
	vim.cmd("only")
end, { desc = "Re-open quicfix window" })


map("n", "<C-b>", ":b", { desc = "Switch buffer (fuzzy)" })

-- native LSP completion popup navigation (replaces blink.cmp's Tab/S-Tab/CR)
map("i", "<Tab>", function() return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>" end,
	{ expr = true, desc = "Next completion item" })
map("i", "<S-Tab>", function() return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>" end,
	{ expr = true, desc = "Previous completion item" })
map("i", "<CR>", function() return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>" end,
	{ expr = true, desc = "Accept completion item" })
