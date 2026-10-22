-- Colors derived from the active colorscheme, so they follow light/dark mode
local M = {}

local function hl_color(group, attr)
	local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
	return hl[attr] and string.format('#%06x', hl[attr]) or nil
end

local function hex_to_rgb(hex)
	return tonumber(hex:sub(2, 3), 16), tonumber(hex:sub(4, 5), 16), tonumber(hex:sub(6, 7), 16)
end

-- mix `top` over `bottom` by `alpha` (0 = bottom, 1 = top)
local function blend(top, bottom, alpha)
	local r1, g1, b1 = hex_to_rgb(top)
	local r2, g2, b2 = hex_to_rgb(bottom)
	local function mix(a, b)
		return math.floor(a * alpha + b * (1 - alpha) + 0.5)
	end
	return string.format('#%02x%02x%02x', mix(r1, r2), mix(g1, g2), mix(b1, b2))
end

function M.get()
	local bg = hl_color('Normal', 'bg') or '#000000'
	local fg = hl_color('Normal', 'fg') or '#ffffff'

	return {
		bg = bg,
		fg = fg,
		bg1 = blend(fg, bg, 0.04),
		bg2 = blend(fg, bg, 0.09),
		bg3 = blend(fg, bg, 0.16),
		grey = hl_color('Comment', 'fg'),
		red = hl_color('DiagnosticError', 'fg'),
		yellow = hl_color('DiagnosticWarn', 'fg'),
		green = hl_color('String', 'fg'),
		blue = hl_color('Function', 'fg'),
		violet = hl_color('Keyword', 'fg'),
		orange = hl_color('Constant', 'fg'),
		teal = hl_color('DiagnosticHint', 'fg'),
	}
end

return M
