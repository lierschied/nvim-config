return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" }, -- Required
        {
            -- Optional
            "williamboman/mason.nvim",
            build = function()
                pcall(vim.cmd, "MasonUpdate")
            end,
        },
        { "williamboman/mason-lspconfig.nvim" }, -- Optional

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },     -- Required
        { "hrsh7th/cmp-nvim-lsp" }, -- Required
        { "L3MON4D3/LuaSnip" },     -- Required
    },
    config = function()
        local lsp = require('lsp-zero').preset({})

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "L", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "H", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()
    end
}
