return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
        local function fg(name)
            return function()
                local hl = vim.api.nvim_get_hl_by_name(name, true)
                return hl and hl.foreground and { fg = string.format('#%06x', hl.foreground) }
            end
        end
        require('lualine').setup({
            options = {
                theme = 'auto',
                globalstatus = true,
                disabled_filetypes = { statusline = { 'dashboard', 'alpha' } },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = {
                    {
                        'diagnostics',
                        symbols = {
                            error = ' ',
                            warn = ' ',
                            info = ' ',
                            hint = ' ',
                        },
                    },
                    {
                        'filetype',
                        icon_only = true,
                        separator = '',
                        padding = {
                            left = 1, right = 0 }
                    },
                    { 'filename', path = 1, symbols = { modified = '  ', readonly = '', unnamed = '' } },
                },
                lualine_x = {
                    { require('lazy.status').updates, cond = require('lazy.status').has_updates, color = fg('Special') },
                    {
                        'diff',
                        symbols = {
                            added = ' ',
                            modified = ' ',
                            removed = ' ',
                        },
                    },
                },
                lualine_y = {
                    { 'progress', separator = ' ',                  padding = { left = 1, right = 0 } },
                    { 'location', padding = { left = 0, right = 1 } },
                },
                lualine_z = {
                    function()
                        return ' ' .. os.date('%R')
                    end,
                },
            },
            extensions = { 'lazy' },
        })
    end
}
