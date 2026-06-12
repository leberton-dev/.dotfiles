local M = {}

function M.setup(specs)
	local to_add = {}
	for _, spec in ipairs(specs) do
		table.insert(to_add, { src = spec.src, name = spec.name })
		for _, dep in ipairs(spec.deps or {}) do
			table.insert(to_add, dep)
		end
	end
	vim.pack.add(to_add)
	for _, spec in ipairs(specs) do
		if spec.config then
			spec.config()
		end
	end
end

return M
