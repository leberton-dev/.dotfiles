vim.keymap.set('i', '<CR>', function()
	if vim.fn.pumvisible() == 1 and vim.fn.complete_info({ 'selected' }).selected ~= -1 then
		return '<C-y>'
	end
	return '<CR>'
end, { expr = true, desc = "Confirm selected completion, else newline" })

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = "Open parent directory" })

vim.keymap.set('n', '<leader>u', '<CMD>Undotree<CR>', { desc = "Toggle Undotree" })

vim.keymap.set('n', '<C-f>', ':find ', { desc = "Find files" })
vim.keymap.set('n', '<C-g>', ':grep! ', { desc = "Grep files" })
vim.keymap.set('n', '<C-s>', function()
	local word = vim.fn.expand('<cword>')
	vim.cmd('grep! -w ' .. vim.fn.shellescape(word))
end, { desc = 'Grep under cursor' })


vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format current file' })
