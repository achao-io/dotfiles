-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.showmatch = true

-- pyenv shims resolve slowly here, making the probe cost ~3s when opening a Python file
vim.g.loaded_python3_provider = 0
