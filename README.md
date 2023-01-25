<h1 align="center">My Nvim Configuration</h1>

My nvim configs inspired by https://github.com/Allaman/nvim. Decided my neovim configurations needed an upgrade, so I ported everything over to lua.
Some options are still configured using vimscript, but the rest of the plugins are configured in lua.

## Features
---
### General
* Plugin management using Lazy
* Terminal integration via nvim-toggleterm.lua
* Git automation using vim-fugitive, gitsigns, gitlinker, octo
* Tree explorer using nvim-tree 
* Async job handler using vim-dispatch
* Telescope for finding files & text
* Status bar using vim-airline
* Fancy notifications via nvim-notify
* Zen mode using goyo

### Coding
* Completion engine using coc-nvim
* Linting and Fixing by ALE
* Enhanced highlighting using tree-sitter 
* vim-go for extra go functions like GoRename, etc
* Mason for linters, lsps, formatters


### Funky addons
* Modulating theme based on the time of the day. I used different themes from https://github.com/EdenEast/nightfox.nvim to change my colorscheme automatically without having to restart neovim. This seems to work as of now.

