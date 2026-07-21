local function augroup(name)
	return vim.api.nvim_create_augroup("config_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("yank"),
	callback = function()
		vim.hl.on_yank({ higroup = "IncSearch", timeout = 150 })
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("reset_cursor"),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local line_nbr = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= line_nbr then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup("trim"),
	callback = function()
		local view = vim.fn.winsaveview()
		vim.cmd([[keeppatterns %s/\s\+$//e]])
		vim.fn.winrestview(view)
	end,
})

-- remap grep to silen grep!
-- remap find to Find
vim.cmd([[
	cnoreabbrev <expr> grep getcmdtype() == ':' && getcmdline() =~# '^grep' ? "silent grep!" : "grep"
	cnoreabbrev <expr> find getcmdtype() == ':' && getcmdline() =~# '^find' ? "Find" : "find"
]])

-- open grep results in a new buffer full window
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	group = augroup("grep_on_window"),
	pattern = "grep",
	callback = function()
		vim.schedule(function()
			vim.cmd("copen")
			-- vim.cmd("only")
		end)
	end,
})

-- close quickfix after pressing enter ( when searching with grep )
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("grep_close_quickfix"),
	pattern = "qf",
	callback = function(ev)
		vim.keymap.set("n", "<CR>", "<CR>:cclose<CR>", { buffer = ev.buf })
	end,
})

-- search all files and open a quickfix window
vim.api.nvim_create_user_command("Find", function(opts)
	local search_term = opts.args
	if search_term == "" then
		print("Please provide a search term.")
		return
	end
	local files = vim.fn.systemlist("rg --files | rg " .. vim.fn.shellescape(search_term))
	local items = {}
	for _, file in ipairs(files) do
		items[#items + 1] = { filename = file }
	end
	vim.fn.setqflist({}, "r", {
		title = "Search Results",
		items = items
	})
	vim.cmd("copen")
	-- vim.cmd("only")
end, { nargs = 1, complete = "file" })

-- create my own style for quickfixes
function _G.my_own_quickfix(info)
	local qf = vim.fn.getqflist({ id = info.id, items = 0 }).items
	local lines = {}
	local max_width = 0
	local max_col_width = 0
	for _, item in ipairs(qf) do
		local pos = string.format("%d col %d", item.lnum, item.col)
		if #vim.fn.bufname(item.bufnr) > max_width then
			max_width = #item.text
		end
		if #pos > max_col_width then
			max_col_width = #pos
		end
	end
	for i = info.start_idx, info.end_idx do
		local item = qf[i]
		local pos = string.format("%d col %d", item.lnum, item.col)
		if item.lnum > 0 then
			lines[#lines + 1] = string.format("%-" .. max_width .. "s | %-" .. max_col_width .. "s | %s",
				vim.fn.bufname(item.bufnr),
				pos,
				item.text)
		else
			lines[#lines + 1] = string.format("%s", vim.fn.bufname(item.bufnr))
		end
	end
	return lines
end

vim.o.quickfixtextfunc = "v:lua.my_own_quickfix"
vim.keymap.set("n", "<C-f>", ":Find ")
vim.keymap.set("n", "<C-g>", ":grep ")
