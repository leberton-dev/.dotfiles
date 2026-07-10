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
	vim.lsp.config("*", {
		capabilities = require("blink.cmp").get_lsp_capabilities(),
	})

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
			vim.keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>",
				{ buffer = args.buf, desc = "Telescope lsp get references" })
			vim.keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>",
				{ buffer = args.buf, desc = "Telescope lsp definitions" })
			vim.keymap.set("n", "<leader>lp", function()
				require("goto-preview").goto_preview_definition()
			end, { buffer = args.buf, desc = "Preview lsp definition (floating)" })
			vim.keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>",
				{ buffer = args.buf, desc = "Telescope lsp implementations" })
			vim.keymap.set("n", "<leader>le", "<cmd>Telescope diagnostics<CR>",
				{ buffer = args.buf, desc = "Telescope diagnostics" })
			vim.keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>",
				{ buffer = args.buf, desc = "Telescope lsp document symbols" })
			vim.keymap.set("n", "<leader>lw", "<cmd>Telescope lsp_workspace_symbols<CR>",
				{ buffer = args.buf, desc = "Telescope lsp workspace symbols" })

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
