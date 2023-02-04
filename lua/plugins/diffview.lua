local open_diff_view = function()
  vim.ui.input({ prompt = 'Diff working tree with branch (leave blank for development): ' }, function(branch_name)
    require('diffview').open(string.len(branch_name) == 0 and 'development' or branch_name)
  end)
end

return {
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
      { '<leader>gg', '<cmd>DiffviewOpen<cr>', desc = 'Diff workspace changes' },
      { '<leader>gG', open_diff_view, desc = 'Diff workspace changes with development' },
      { '<leader>gF', '<cmd>DiffviewFileHistory %<cr>', desc = 'File history (this file)' },
      { '<leader>gf', '<cmd>DiffviewFileHistory<cr>', desc = 'File history' },
      { '<leader>gd', '<cmd>DiffviewClose<cr>', desc = 'Close diffview' },
    },
  },
}
