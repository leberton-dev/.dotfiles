vim.diagnostic.config({ virtual_text = false })
require('tiny-inline-diagnostic').setup()

require('neoscroll').setup({
	-- no <C-f>: used by telescope find_files
	mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
})

require('smear_cursor').setup()
