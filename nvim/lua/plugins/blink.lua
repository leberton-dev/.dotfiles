return {
	src = "https://github.com/saghen/blink.cmp",
	deps = {
		{ src = "https://github.com/saghen/blink.lib" }
	},
	config = function()
		require("blink.cmp").setup({
			keymap = {
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<CR>"] = { "select_and_accept", "fallback" },
			},
			fuzzy = { implementation = "prefer_rust" },
			sources = { default = { "lsp", "buffer", "path" } },
			completion = {
				menu = { border = "none" },
				documentation = {
					auto_show = true,
					window = { border = "none" },
				},
				ghost_text = { enabled = true },
			},
		})
	end,
}
