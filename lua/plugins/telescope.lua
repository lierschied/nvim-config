return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = 'Telescope show buffers' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = {
                    'node_modules', 'build', 'dist', 'yarn.lock', 'target'
                }
            }
        })
    end
}
