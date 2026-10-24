-- Sessions
require('persistence').setup()

vim.keymap.set('n', '<leader>qs', function() require('persistence').load() end, { desc = 'Restore session (cwd)' })
vim.keymap.set('n', '<leader>ql', function() require('persistence').load({ last = true }) end, { desc = 'Restore last session' })
vim.keymap.set('n', '<leader>qS', function() require('persistence').select() end, { desc = 'Select session' })
vim.keymap.set('n', '<leader>qd', function() require('persistence').stop() end, { desc = "Don't save session" })

-- Tasks
require('overseer').setup()

vim.keymap.set('n', '<leader>or', '<CMD>OverseerRun<CR>', { desc = 'Run task' })
vim.keymap.set('n', '<leader>ot', '<CMD>OverseerToggle<CR>', { desc = 'Toggle task list' })

-- Termdebug (gdb)
vim.g.termdebug_wide = 1
