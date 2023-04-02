vim.keymap.set('n', '<leader>w', ':update<CR>', {})
vim.keymap.set('n', '<leader>Q', ':q<CR>', {})

vim.keymap.set('n', '<leader>e', ':Explore<CR>', {})

--Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
