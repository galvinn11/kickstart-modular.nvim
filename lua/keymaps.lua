-- [[ Basic Keymaps ]]

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Save without formatting
vim.keymap.set('n', '<leader>wn', '<cmd>noautocmd w<CR>', { desc = '[W]rite file with [n]o auto-formatting' })

-- Text manipulation
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = '[Y]ank to system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>Y', [["+Y]], { desc = '[Y]ank line to system clipboard' })
vim.keymap.set('v', 'p', '"_dP', { desc = '[P]ut over selection w/o rewriting register' })
vim.keymap.set({ 'n', 'v' }, 'x', [["_x]], { desc = 'Delete character to void' })
vim.keymap.set({ 'n', 'v' }, 'X', [["_X]], { desc = 'Backspace character to void' })
vim.keymap.set('n', 'J', [[mzJ`z]], { desc = 'Join line and keep cursor in place' })

-- Use hjkl to move in insert mode
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Use arrow letters in insert mode' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Use arrow letters in insert mode' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Use arrow letters in insert mode' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Use arrow letters in insert mode' })

-- Scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll half page down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll half page up and center' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next match and center' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev match and center' })

-- Line manipulation
vim.keymap.set('v', 'J', [[:m '>+1<CR>gv=gv]], { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', [[:m '<-2<CR>gv=gv]], { desc = 'Move selected lines up' })
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left - Stay in indent mode' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right - Stay in indent mode' })

-- Terminal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
-- vim.keymap.set('n', '<leader>Th', '<cmd>split | terminal pwsh<CR>', { desc = 'Open terminal in horizontal split' })
vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal size=15<CR>', { desc = 'Open terminal in horizontal split' })
vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical size=80<CR>', { desc = 'Open terminal in vertical split' })
vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Open floating terminal' })
-- vim.keymap.set('n', '<leader>Tv', '<cmd>vsplit | terminal pwsh<CR>', { desc = 'Open terminal in vertical split' })

--  Window manipulation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<S-Right>', '<C-w>>', { desc = 'Resize window' })
vim.keymap.set('n', '<S-Left>', '<C-w><', { desc = 'Resize window' })
vim.keymap.set('n', '<S-Up>', '<C-w>+', { desc = 'Resize window' })
vim.keymap.set('n', '<S-Down>', '<C-w>-', { desc = 'Resize window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

-- [[ Basic Autocommands ]]

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- vim: ts=2 sts=2 sw=2 et
