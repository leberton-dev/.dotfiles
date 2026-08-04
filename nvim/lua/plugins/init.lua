local M = {}

M.setup = function()
	require("loader").setup({
		require("plugins.gitsigns"),
		require("plugins.oil"),
		require("plugins.treesitter"),
		-- require("plugins.markview"),
		require("plugins.autopairs"),
		require("plugins.which_key"),
		require("plugins.love2d"),
		require("plugins.themery"),
	})
end

return M
