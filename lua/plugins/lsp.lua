return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {
            -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
    },
    config = function()
        local lsp = require('lsp-zero').preset({})

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
            vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { desc = 'goto definition' })
            vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format() end, { desc = 'LSP format' })
            vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, { desc = 'show signature help' })
            vim.keymap.set('n', '<leader>lws', function() vim.lsp.buf.workspace_symbol() end,
                { desc = 'LSP workspace symbol' })
            vim.keymap.set('n', '<leader>ld', function() vim.diagnostic.open_float() end,
                { desc = 'LSP line diagnostic' })
            vim.keymap.set('n', 'L', function() vim.diagnostic.goto_next() end, { desc = 'LSP next diagnostic' })
            vim.keymap.set('n', 'H', function() vim.diagnostic.goto_prev() end, { desc = 'LSP previous diagnostic' })
            vim.keymap.set('n', '<leader>la', function() vim.lsp.buf.code_action() end, { desc = 'LSP code action' })
            vim.keymap.set('n', '<leader>lr', function() vim.lsp.buf.references() end, { desc = 'LSP show references' })
            vim.keymap.set('n', '<leader>r', function() vim.lsp.buf.rename() end, { desc = 'LSP rename' })
            -- vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, {desc=''})
        end)

        local lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
        lspconfig.pyright.setup {}

        lsp.setup()
    end
}
