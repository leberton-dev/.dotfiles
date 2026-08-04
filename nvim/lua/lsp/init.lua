local M = {}

local init_mason = function()
	vim.pack.add({
		{ src = "https://github.com/mason-org/mason.nvim" },
		{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	})
	require("mason").setup()
	require("mason-tool-installer").setup({
		ensure_installed = {
			"lua-language-server",
			"pyright",
			--"clangd", no clangd because of arch not beeing able to install clangd for the right architecture
			"css-lsp",
			"html-lsp",
			"typescript-language-server",
			"autotools-language-server",
			"bash-language-server",
		},
	})
end

local start_servers = function()
	for _, path in ipairs(vim.api.nvim_get_runtime_file("lua/lsp/servers/*.lua", true)) do
		local name = vim.fn.fnamemodify(path, ":t:r")
		vim.lsp.config(name, require("lsp.servers." .. name))
		vim.lsp.enable(name)
	end
end

M.setup = function()
	init_mason()
	start_servers()

	local fmt_group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true })

	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)

			if client then
				vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
			end

			vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition,
				{ buffer = args.buf, desc = "LSP definition" })
			vim.keymap.set("n", "<leader>le", function() vim.diagnostic.setqflist() end,
				{ buffer = args.buf, desc = "LSP diagnostics (quickfix)" })
			vim.keymap.set("n", "<leader>lw", vim.lsp.buf.workspace_symbol,
				{ buffer = args.buf, desc = "LSP workspace symbols" })

			if client and client:supports_method("textDocument/formatting") then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = fmt_group,
					buffer = args.buf,
					callback = function()
						vim.lsp.buf.format({ async = false, bufnr = args.buf })
					end,
				})
			end
		end,
	})
end

return M
