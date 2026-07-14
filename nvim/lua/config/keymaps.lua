local map = vim.keymap.set

map("n", "<leader><leader>x", "<cmd> source %<CR>", { desc = "Source current file" })
map("v", ">", ">gv", { desc = "Indent selected text to the right" })
map("v", "<", "<gv", { desc = "Indent selected text to the left" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostics" })

-- reopen quickfix window after closing it
map("n", "<leader>q", function() vim.cmd("copen") vim.cmd("only") end, { desc = "Re-open quicfix window" })
