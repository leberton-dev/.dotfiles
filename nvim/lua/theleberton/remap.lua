vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = "Open parent directory" })

vim.keymap.set('n', '<leader>u', '<CMD>Undotree<CR>', { desc = "Toggle Undotree" })

vim.keymap.set('n', '<C-f>', ':find ', { desc = "Find files" })
vim.keymap.set('n', '<C-g>', ':grep! ', { desc = "Grep files" })
vim.keymap.set('n', '<C-s>', function()
	local word = vim.fn.expand('<cword>')
	vim.cmd('grep! -w ' .. vim.fn.shellescape(word))
end, { desc = 'Grep under cursor' })
