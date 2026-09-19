vim.keymap.set('i', '<CR>', function()
	if vim.fn.pumvisible() == 1 and vim.fn.complete_info({ 'selected' }).selected ~= -1 then
		return '<C-y>'
	end
	return '<CR>'
end, { expr = true, desc = "Confirm selected completion, else newline" })

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = "Open parent directory" })

vim.keymap.set('n', '<leader>u', '<CMD>Undotree<CR>', { desc = "Toggle Undotree" })

-- vim.keymap.set('n', '<C-f>', ':find ', { desc = "Find files" })
-- vim.keymap.set('n', '<C-g>', ':grep! ', { desc = "Grep files" })
-- vim.keymap.set('n', '<C-s>', function()
-- 	local word = vim.fn.expand('<cword>')
-- 	vim.cmd('grep! -w ' .. vim.fn.shellescape(word))
-- end, { desc = 'Grep under cursor' })

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<C-f>', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-g>', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })


vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, { desc = 'Format current file' })

-- Harpoon
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
vim.keymap.set('n', '<leader>ha', harpoon_mark.add_file, { desc = 'Harpoon add file' })
vim.keymap.set('n', '<leader>hm', harpoon_ui.toggle_quick_menu, { desc = 'Harpoon toggle menu' })
vim.keymap.set('n', '<leader>1', function ()
	harpoon_ui.nav_file(1)
end, { desc = 'Harpoon nav file1' })
vim.keymap.set('n', '<leader>2', function ()
	harpoon_ui.nav_file(2)
end, { desc = 'Harpoon nav file2' })
vim.keymap.set('n', '<leader>3', function ()
	harpoon_ui.nav_file(3)
end, { desc = 'Harpoon nav file3' })
vim.keymap.set('n', '<leader>4', function ()
	harpoon_ui.nav_file(4)
end, { desc = 'Harpoon nav file4' })

