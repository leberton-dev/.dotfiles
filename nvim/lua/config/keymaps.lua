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
local function next_key()
	if vim.fn.pumvisible() == 1 then return "<C-n>" end
	if vim.snippet.active({ direction = 1 }) then return "<cmd>lua vim.snippet.jump(1)<CR>" end
	return "<Tab>"
end

local function prev_key()
	if vim.fn.pumvisible() == 1 then return "<C-p>" end
	if vim.snippet.active({ direction = -1 }) then return "<cmd>lua vim.snippet.jump(-1)<CR>" end
	return "<S-Tab>"
end

map("i", "<Tab>", next_key, { expr = true, desc = "Next completion item / snippet placeholder" })
map("i", "<S-Tab>", prev_key, { expr = true, desc = "Previous completion item / snippet placeholder" })
map("i", "<CR>", function() return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>" end,
	{ expr = true, desc = "Accept completion item" })
