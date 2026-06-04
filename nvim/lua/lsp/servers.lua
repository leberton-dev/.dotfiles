return {
	["lua_ls"] = {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		root_markers = { ".luarc.json", ".luarc.jsonc", "main.lua", ".git" },
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true)
				},
				completion = { callSnippet = "Replace" },
				hint = { enable = true }
			}
		}
	},
	["pyright"] = {
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_markers = { "pyrightconfig.json", ".git" },
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "workspace"
				}
			}
		}
	},
	["clangd"] = {
		cmd = { "clangd" },
		filetypes = { "c", "cpp" },
		root_markers = { ".clang-format", ".git" }
	},
	["cssls"] = {
		cmd = { "vscode-css-language-server", "--stdio" },
		filetypes = { "css", "scss", "less" },
		root_markers = { "package.json", ".git" }
	},
	["html"] = {
		cmd = { "vscode-html-language-server", "--stdio" },
		filetypes = { "html" },
		root_markers = { "package.json", ".git" }
	},
	["ts_ls"] = {
		cmd = { "typescript-language-server", "--stdio" },
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" }
	},
	["autotools_ls"] = {
		cmd = { "autotools-language-server" },
		filetypes = { "make" },
		root_markers = { "Makefile" }
	}
}
