return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                theme = 'auto',
                -- section_separators = { left = '', right = '' },
                -- component_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff' },
                lualine_c = { 'filename', 'diagnostics' },
                lualine_x = { { 'lsp_status', symbols = { separator = ' + ' } } },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {
                lualine_a = { { 'filename', path = 1 } },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { { 'tabs', mode = 0, path = 0 } },
            },
            -- winbar = {
            --     lualine_a = { { 'filename', path = 3 } },
            -- },
            extensions = { 'neo-tree' },
        }
    end,
}
