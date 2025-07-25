return {
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        lazy = false,
        config = function()
            require('toggleterm').setup {
                size = 15,
                open_mapping = [[<C-\>]],
                direction = 'float',
                float_opts = { border = 'curved' },
                border = 'rounded',
                shell = 'pwsh',
            }

            -- LazyGit terminal setup
            local Terminal = require('toggleterm.terminal').Terminal
            local lazygit = Terminal:new {
                cmd = 'lazygit',
                hidden = true,
                direction = 'float',
                float_opts = { border = 'rounded' },
            }
            local pyTerm = Terminal:new {
                cmd = 'python',
                hidden = true,
                direction = 'float',
                float_opts = { border = 'rounded' },
            }

            vim.keymap.set('n', '<leader>tg', function()
                lazygit:toggle()
            end, { desc = '[T]oggle Lazy[g]it (float)' })

            vim.keymap.set('n', '<leader>tp', function()
                pyTerm:toggle()
            end, { desc = '[T]oggle [p]ython terminal (float)' })
        end,

        keys = {
            { '<leader>tt', '<cmd>ToggleTerm<CR>', desc = '[T]oggle [t]erminal' },
        },
    },
}
