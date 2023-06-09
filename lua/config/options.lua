--vim.cmd[[colorscheme tokyonight]]
vim.o.termguicolors = true

-- THICK cursor
--vim.opt.guicursor = ''
-- vim.opt.statuscolumn = '%C%=%l|%r%s'
vim.opt.statuscolumn = '%@SignCb@%s%=%T%@NumCb@%r│%T'
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50
