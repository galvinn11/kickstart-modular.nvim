-- function Colors(index)
--     local colorMap = { 'tokyonight-night', 'kanagawa-dragon', 'tokyonight-storm' }
--     local color = colorMap[index] or colorMap[1]
--     vim.cmd.colorscheme(color)
-- end

local colorMap = { 'tokyonight-night', 'kanagawa-dragon', 'tokyonight-storm' }
local currentIndex = 1

function Colors(index)
    local color = 'tokyonight-night'

    if index then
        color = colorMap[index] or color
    else
        currentIndex = currentIndex % #colorMap + 1
        color = colorMap[currentIndex]
    end

    -- Apply the colorscheme
    vim.cmd.colorscheme(color)

    -- Echo to command line
    vim.defer_fn(function()
        vim.api.nvim_echo({ { 'Colorscheme: ' .. color, 'MoreMsg' } }, false, {})
    end, 0) -- delay in milliseconds
end

-- vim.schedule(function()
--     Colors()
-- end)

return {
    { -- You can easily change to a different colorscheme.
        -- Change the name of the colorscheme plugin below, and then
        -- change the command in the config to whatever the name of that colorscheme is.
        --
        -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
        'folke/tokyonight.nvim',
        priority = 1000, -- Make sure to load this before all the other start plugins.
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require('tokyonight').setup {
                styles = {
                    comments = { italic = false }, -- Disable italics in comments
                },
            }

            -- Load the colorscheme here.
            -- Like many other themes, this one has different styles, and you could load
            -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
            vim.cmd.colorscheme 'tokyonight-night'
            vim.keymap.set('n', '<leader>cl', '<cmd>lua Colors()<CR>', { desc = 'Cycle color schemes: 1-' .. #colorMap })
            vim.keymap.set('n', '<leader>cL', ':lua Colors(', { desc = 'Start calling the function to set the color scheme' })
            -- vim.keymap.set('n', '<leader>cl3', ':lua Colors(3)<CR>', { desc = 'Set the color scheme to tokyonight-storm' })
        end,
    },
    {
        'rebelot/kanagawa.nvim',
        name = 'kanagawa',
        priority = 1000,
        -- config = function()
        --     vim.cmd.colorscheme "kanagawa"
        -- end
    },
}
-- vim: ts=2 sts=2 sw=2 et
