local opt = vim.o

vim.g.mapleader = " "

-- UI / Appearance
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.wrap = false

-- Scroll / Navigation
opt.scrolloff = 16

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true

-- Files
opt.swapfile = false
opt.undofile = true

-- System
opt.clipboard = "unnamedplus"
