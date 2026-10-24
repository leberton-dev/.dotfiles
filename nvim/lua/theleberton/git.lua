require('gitsigns').setup({
	current_line_blame_opts = { delay = 300 },
	on_attach = function(buf)
		local gs = require('gitsigns')
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
		end
		
		map('n', ']h', function() gs.nav_hunk('next') end, 'Next hunk')
		map('n', '[h', function() gs.nav_hunk('prev') end, 'Prev hunk')

		map('n', '<leader>gs', gs.stage_hunk, 'Stage hunk')
		map('n', '<leader>gr', gs.reset_hunk, 'Reset hunk')
		map('v', '<leader>gs', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, 'Stage selection')
		map('n', '<leader>gS', gs.stage_buffer, 'Stage buffer')
		map('n', '<leader>gp', gs.preview_hunk_inline, 'Preview hunk')
		map('n', '<leader>gb', function() gs.blame_line({ full = true }) end, 'Blame line')
		map('n', '<leader>gB', gs.toggle_current_line_blame, 'Toggle inline blame')
		map('n', '<leader>gd', gs.diffthis, 'Diff file')

		map({'o', 'x'}, 'ih', gs.select_hunk, 'Hunk text object')
	end,
})
