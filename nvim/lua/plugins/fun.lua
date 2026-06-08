local M = {}

-- leetcode
local _leetcode = function()
	vim.pack.add({
		{ src = "https://github.com/kawre/leetcode.nvim" },
		{ src = "https://github.com/MunifTanjim/nui.nvim" }
	})
	require("leetcode").setup()
end

M.setup = function()
	_leetcode()
end

return M
