-- NvChad-like borderless telescope
local palette = require('theleberton.palette')

require('telescope').setup({
	defaults = {
		prompt_prefix = ' \u{f002}  ',
		selection_caret = ' ',
		entry_prefix = ' ',
		sorting_strategy = 'ascending',
		layout_config = {
			horizontal = { prompt_position = 'top', preview_width = 0.55 },
			width = 0.87,
			height = 0.80,
		},
	},
})

local function apply_highlights()
	local c = palette.get()
	local hl = function(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
	end

	hl('TelescopeNormal', { fg = c.fg, bg = c.bg1 })
	hl('TelescopeBorder', { fg = c.bg1, bg = c.bg1 })
	hl('TelescopePromptNormal', { fg = c.fg, bg = c.bg2 })
	hl('TelescopePromptBorder', { fg = c.bg2, bg = c.bg2 })
	hl('TelescopePromptPrefix', { fg = c.red, bg = c.bg2 })
	hl('TelescopePromptTitle', { fg = c.bg, bg = c.red, bold = true })
	hl('TelescopePreviewTitle', { fg = c.bg, bg = c.green, bold = true })
	hl('TelescopeResultsTitle', { fg = c.bg1, bg = c.bg1 })
	hl('TelescopeSelection', { fg = c.fg, bg = c.bg3 })
	hl('TelescopeMatching', { fg = c.blue, bold = true })
end

apply_highlights()

vim.api.nvim_create_autocmd('ColorScheme', {
	desc = 'Reapply telescope highlights',
	callback = apply_highlights,
})
