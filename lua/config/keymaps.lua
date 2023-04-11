vim.keymap.set('n', '<leader>w', ':update<CR>', { desc = 'save' })
vim.keymap.set('n', '<leader>Q', ':q<CR>', { desc = 'quit' })

vim.keymap.set('n', '<leader>L', ':Lazy<CR>', { desc = 'Lazy Menu' })
vim.keymap.set('n', '<leader>li', ':LspInfo<CR>', { desc = 'LspInfo' })
vim.keymap.set('n', '<leader>lm', ':Mason<CR>', { desc = 'Mason' })


-- Buffers
vim.keymap.set('n', '<leader>bc', ':bdelete<CR>', { desc = 'Buffer delete' })
vim.keymap.set('n', '<leader>bh', ':bprevious<CR>', { desc = 'Buffer previous' })
vim.keymap.set('n', '<leader>bl', ':bnext<CR>', { desc = 'Buffer next' })

vim.keymap.set('n', '<leader>e', ':Explore<CR>', { desc = 'Explore' })
