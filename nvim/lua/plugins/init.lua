local M = {}

M.setup = function()
	require("plugins.ui").setup()
	require("plugins.editor").setup()
	require("plugins.git").setup()
	require("plugins.navigation").setup()
	require("plugins.diagnostics").setup()
	require("plugins.fun").setup()
end



return M
