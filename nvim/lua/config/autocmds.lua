local function augroup(name)
	return vim.api.nvim_create_augroup("config_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufEnter", {
	group = augroup("set_path"),
	callback = function(ev)
		if vim.bo[ev.buf].buftype ~= "" then
			return
		end
		local root = vim.fs.root(ev.buf, ".git")
		if root == nil then
			return
		end
		vim.cmd.lcd(root)
	end,
})

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

-- remap grep/make to silent grep!/make, so raw output doesn't hit "press ENTER"
vim.cmd([[
	cnoreabbrev <expr> grep getcmdtype() == ':' && getcmdline() =~# '^grep' ? "silent grep!" : "grep"
	cnoreabbrev <expr> make getcmdtype() == ':' && getcmdline() =~# '^make' ? "silent make" : "make"
]])

-- open grep/make results in a new buffer full window (make only if there are errors)
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	group = augroup("grep_on_window"),
	pattern = { "grep", "make" },
	callback = function(ev)
		if ev.match == "make" and #vim.fn.getqflist() == 0 then
			return
		end
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
vim.keymap.set("n", "<C-f>", ":find ")
vim.keymap.set("n", "<C-g>", ":grep ")
vim.keymap.set("n", "<C-s>", ':grep <C-r><C-w><CR>', { desc = "Grep word under cursor" })
