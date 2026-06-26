return {
	src = "https://github.com/zbirenbaum/copilot.lua",
	deps = {
		{ src = "https://github.com/giuxtaposition/blink-cmp-copilot" },
	},
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	end,
}
