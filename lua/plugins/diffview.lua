local open_diff_view = function()
  vim.ui.input({ prompt = 'Diff working tree with branch: ' }, function(branch_name)
    -- TODO: hooking this up to telescope to select a branch would be awesome
    if branch_name ~= nil and string.len(branch_name) > 0 then
      require('diffview').open(branch_name)
    else
      vim.cmd('DiffviewOpen')
    end
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
