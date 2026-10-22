-- NvChad-like statusline built on lualine
local palette = require('theleberton.palette')

local icons = {
	vim = '\u{e62b}',
	branch = '\u{e725}',
	lsp = '\u{f085}',
	folder = '\u{f07b}',
	position = '\u{e612}',
	modified = '\u{f111}',
	round_left = '\u{e0b6}',
	round_right = '\u{e0b4}',
}

local function mode_colors(c, color)
	return {
		a = { fg = c.bg, bg = color, gui = 'bold' },
		b = { fg = c.fg, bg = c.bg3 },
		c = { fg = c.grey, bg = c.bg1 },
	}
end

local function build_theme()
	local c = palette.get()
	return {
		normal = mode_colors(c, c.blue),
		insert = mode_colors(c, c.green),
		visual = mode_colors(c, c.violet),
		replace = mode_colors(c, c.red),
		command = mode_colors(c, c.yellow),
		terminal = mode_colors(c, c.teal),
		inactive = mode_colors(c, c.grey),
	}
end

local function lsp_clients()
	local names = {}
	for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
		table.insert(names, client.name)
	end
	return table.concat(names, ' ')
end

local function cwd_name()
	return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
end

local function setup()
	require('lualine').setup({
		options = {
			theme = build_theme(),
			globalstatus = true,
			component_separators = '',
			section_separators = { left = icons.round_right, right = icons.round_left },
		},
		sections = {
			lualine_a = { { 'mode', icon = icons.vim } },
			lualine_b = {
				{ 'filetype', icon_only = true, padding = { left = 1, right = 0 } },
				{ 'filename', symbols = { modified = icons.modified } },
			},
			lualine_c = { { 'branch', icon = icons.branch }, 'diff' },
			lualine_x = { 'diagnostics', { lsp_clients, icon = icons.lsp } },
			lualine_y = { { cwd_name, icon = icons.folder } },
			lualine_z = { { 'location', icon = icons.position } },
		},
	})
end

setup()

vim.api.nvim_create_autocmd('ColorScheme', {
	desc = 'Rebuild statusline colors',
	callback = setup,
})
