return {
    {
        'm4xshen/autoclose.nvim',
        config = function()
            require('autoclose').setup()
        end
    },
    {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    -- {
    --     'ggandor/leap.nvim',
    --     requires = { 'tpope/vim-repeat' },
    -- },
    -- {
    --     'ggandor/flit.nvim',
    --     config = function()
    --         require('flit').setup {
    --             keys = { f = 'f', F = 'F', t = 't', T = 'T' },
    --         }
    --     end
    -- },
    {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local alpha = require('alpha')
            local dashboard = require('alpha.themes.dashboard')
            require('alpha.term')

            local header = {
                type = 'terminal',
                -- https://dom111.github.io/image-to-ansi/
                command = 'cat | ' .. os.getenv('HOME') .. '/.config/nvim/lua/config/alpha/header.sh',
                width = 80,
                height = 26,
                opts = {
                    position = 'center',
                    hl = 'String',
                },
            }

            local buttons = {
                type = 'group',
                val = {
                    { type = 'text', val = 'Quick links', opts = { hl = 'SpecialComment', position = 'center' } },
                    dashboard.button('f', ' ' .. ' Find file', ':Telescope find_files <CR>'),
                    dashboard.button('e', ' ' .. ' New file', ':ene <BAR> startinsert <CR>'),
                    dashboard.button('r', ' ' .. ' Recent files', ':Telescope oldfiles <CR>'),
                    dashboard.button('t', ' ' .. ' Find text', ':Telescope live_grep <CR>'),
                    dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
                },
            }

            local config = {
                layout = {
                    header,
                    { type = 'padding', val = 6 },
                    buttons,
                },
            }

            alpha.setup(config)
        end
    },
    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
        config = function()
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'

            luasnip.config.setup {}

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert {
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<C-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
            }
        end
    },
}
