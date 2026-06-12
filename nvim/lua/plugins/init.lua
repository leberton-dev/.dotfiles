local M = {}

M.setup = function()
	require("loader").setup({
		require("plugins.gitsigns"),
		require("plugins.telescope"),
		require("plugins.oil"),
		require("plugins.treesitter"),
		require("plugins.markview"),
		require("plugins.autopairs"),
		require("plugins.zen_mode"),
		require("plugins.which_key"),
		require("plugins.love2d"),
		require("plugins.trouble"),
		require("plugins.themery"),
		require("plugins.blink"),
	})
end

return M
