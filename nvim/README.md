# My nvim config
This is my personal simple nvim config, native vim.pack (nvim 0.12)

## Prerequisites
- Neovim 0.12+
- git
- clangd on system
- node (for lsp, js, etc..)

## Structure
```
.
├── init.lua
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   └── options.lua
│   ├── loader.lua
│   ├── lsp
│   │   ├── init.lua
│   │   └── servers
│   └── plugins
├── nvim-pack-lock.json
└── README.md
```

## Keymaps


| Keymap | Mode | Action |
|--------|------|--------|
| `<leader><leader>x` | n | source current file |
| `<leader>e` | n | open floating diagnostics |
| `>` | v | Indent to the right |
| `<` | v | Indent to the left |
| `<C-f>` | n | Telescope find files |
| `<C-g>` | n | Telescope live grep |
| `<C-s>` | n | Telescope grep word under cursor |
| `-` | n | Open Oil |
| `q`/`<C-c>` | in Oil | Close Oil |
| `<leader>lr` | n | LSP references |
| `<leader>ld` | n | LSP definitions |
| `<leader>li` | n | LSP implementations |
| `<leader>le` | n | Diagnostics list |
| `<leader>ls` | n | LSP document symbols |
| `<leader>lw` | n | LSP workspace symbols |
| `<leader>xx` | n | Trouble diagnostics |
| `<leader>xs` | n | Trouble symbols |
| `<leader>xl` | n | Trouble references / definitions LSP |
| `<leader>xq` | n | Trouble quickfix |
| `<Tab>` | i | blink.cmp next element |
| `<S-Tab>` | i | blink.cmp previous element |
| `<CR>` | i | blink.cmp select element |


## Themes
use `:Themery` cmd to change theme
