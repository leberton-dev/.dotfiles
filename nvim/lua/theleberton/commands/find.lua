local M = {}

local files_cache = nil

local function get_files()
	if not files_cache then
		files_cache = vim.fn.systemlist({ 'rg', '--files' })
	end
	return files_cache
end

function M.findfunc(cmdarg, cmdcomplete)
	local files = get_files()
	if cmdarg == "" then
		return files
	end
	return vim.fn.matchfuzzy(files, cmdarg)
end

_G.theleberton_findfunc = M.findfunc
vim.o.findfunc = "v:lua.theleberton_findfunc"

vim.api.nvim_create_autocmd("DirChanged", {
	callback = function()
		files_cache = nil
	end
})

return M

