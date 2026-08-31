-- vim.lsp.config('clangd', {
-- 	cmd = 'clangd',
-- 	filetypes = { 'c' },
-- 	root_markers = { '.clangd', 'compile_commands.json', '.git' }
-- })
--
-- vim.lsp.config('lua_ls', {
-- 	cmd = 'lua-language-server',
-- 	filetypes = { 'lua' },
-- 	root_markers = { '.luarc.json', '.git' }
-- })

vim.lsp.config('basedpyright', {
	root_markers = { { '.git' }, { 'pyrightconfig.json', 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile' } }
})

vim.lsp.enable({ 'clangd', 'lua_ls', 'basedpyright', 'ruff' })

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		vim.lsp.completion.enable(true, args.data.client_id, args.buf, {
			autotrigger = true
		})

		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
			buffer = args.buf,
			desc = 'Goto Definition'
		})
	end
})
