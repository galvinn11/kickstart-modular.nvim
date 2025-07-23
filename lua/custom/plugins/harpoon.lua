-- Harpoon
return {
    'ThePrimeagen/harpoon',
    config = function()
        local mark = require 'harpoon.mark'
        local ui = require 'harpoon.ui'

        vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'M[a]rk a file - Harpoon' })
        vim.keymap.set('n', '<leader>H', ui.toggle_quick_menu, { desc = 'Open [H]arpoon menu' })

        vim.keymap.set('n', '<C-n>', function()
            ui.nav_next()
        end, { desc = '[N]ext Harpoon marked file' })
        vim.keymap.set('n', '<C-p>', function()
            ui.nav_prev()
        end, { desc = '[P]rev Harpoon marked file' })
    end,
}
