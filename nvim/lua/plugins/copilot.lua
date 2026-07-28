return {
	src = "https://github.com/zbirenbaum/copilot.lua",
	deps = {
		{ src = "https://github.com/giuxtaposition/blink-cmp-copilot" },
	},
	config = function()
		vim.api.nvim_create_user_command("ToggleCopilot", function()
			if not require("copilot").setup_done then
				require("copilot").setup({
					suggestion = { enabled = false },
					panel = { enabled = false },
				})
				return
			end
			if require("copilot.client").is_disabled() then
				require("copilot.command").enable()
				vim.notify("Copilot enabled", vim.log.levels.INFO)
			else
				require("copilot.command").disable()
				vim.notify("Copilot disabled", vim.log.levels.INFO)
			end
		end, {})
	end,
}
