vim.opt.termguicolors = true

vim.opt.number = true  				-- line number
vim.opt.relativenumber = true 			-- relative line number
vim.opt.cursorline = true 			-- highlight current line
vim.opt.wrap = false 				-- do not wrap lines by default
vim.opt.scrolloff = 10				-- keep x lines above/below cursor
vim.opt.sidescrolloff = 10			-- keep x lines to left/right of cursor

vim.opt.tabstop = 4					-- tabwidth
vim.opt.shiftwidth = 4				-- indent width
vim.opt.softtabstop = 4				-- soft tab stop not tabs on tab/backspace
vim.opt.expandtab = false			-- use spaces instead of tabs
vim.opt.smartindent = true			-- smart auto-indent
vim.opt.autoindent = true			-- copy indent from current line

vim.opt.ignorecase = true			-- case insensitive search
vim.opt.smartcase = true			-- case sensitive if uppercase in string
vim.opt.hlsearch = true				-- highlight search matches
vim.opt.incsearch = true			-- show matches as you type

vim.opt.signcolumn = "yes"			-- always show a sign column
vim.opt.colorcolumn = "80"			-- show a column at x position chars
vim.opt.showmatch = true			-- highlights matching brackets
vim.opt.cmdheight = 1				-- single line command line
vim.opt.autocomplete = true			-- show a completion menu as you type
vim.opt.completeopt = "fuzzy,menuone,noinsert,noselect" -- completion options
vim.opt.complete:append('o')		-- add omni completion
vim.opt.showmode = false			-- do not show the mode, instead have it in the statusline
vim.opt.pumheight = 10				-- popup menu height
vim.opt.pumblend = 10				-- popup menu transparency
vim.opt.winblend = 0				-- floating window transparency
vim.opt.conceallevel = 0			-- do not hide markup
vim.opt.concealcursor = ""			-- do not hide cursorline in markup

local undodir = vim.fn.expand("$HOME/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
		vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false				-- do not create a backup file
vim.opt.writebackup = false			-- do not write to a backup
vim.opt.swapfile = false			-- do not create a swapfile
vim.opt.undofile = true				-- do create an undofile

require("vim._core.ui2").enable({})

vim.diagnostic.config({ virtual_text = true })

vim.opt.grepprg = 'rg --vimgrep --smart-case'
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.clipboard = 'unnamedplus'

