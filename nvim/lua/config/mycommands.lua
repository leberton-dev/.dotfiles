local is_tab_line_set = false

local function set_tabline()
	if is_tab_line_set then
		vim.opt.colorcolumn = "80"
	else
		vim.opt.colorcolumn = "0"
	end
	is_tab_line_set = not is_tab_line_set
end

vim.api.nvim_create_user_command("Ctab", function() set_tabline() end, { nargs = 0 })

set_tabline()
