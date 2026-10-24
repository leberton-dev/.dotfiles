vim.api.nvim_create_autocmd('FileType', {
	desc = 'Enable treesitter highlight and indent',
	callback = function(args)
		if pcall(vim.treesitter.start, args.buf) then
			vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldtext = '' -- Keep first line with its highlight
vim.opt.foldlevel = 99 -- everything open by default

require('treesitter-context').setup({
	max_lines = 3,
})

vim.keymap.set('n', '[x', function()
	require('treesitter-context').go_to_context(vim.v.count1)
end, { desc = 'Jump to context' } )
