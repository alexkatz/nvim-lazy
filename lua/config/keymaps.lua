-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- centers cursor on page up or page down
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- centers cursor on next/prev search
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })

-- save, save all
vim.keymap.set({ 'i', 'v', 'n', 's' }, '<M-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
vim.keymap.set({ 'i', 'v', 'n', 's' }, '<M-a>', '<cmd>wa<cr><esc>', { desc = 'Save file' })

-- vertical split
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Vertical Split' })

-- remove lazygit bindings
vim.api.nvim_del_keymap('n', '<leader>gg')
vim.api.nvim_del_keymap('n', '<leader>gG')
vim.api.nvim_del_keymap('n', '<leader>gc')
vim.api.nvim_del_keymap('n', '<leader>gs')

-- undo tree
vim.keymap.set(
  'n',
  '<leader>U',
  '<Cmd>UndotreeToggle<CR>',
  { noremap = true, silent = true, desc = 'Toggle Undo Tree' }
)
