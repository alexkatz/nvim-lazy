local open_diff_view = function()
  require('telescope.builtin').git_branches({
    attach_mappings = function(_, map)
      map('i', '<CR>', function(prompt_bufnr)
        local selection = require('telescope.actions.state').get_selected_entry()
        require('telescope.actions').close(prompt_bufnr)
        require('diffview').open(selection.value)
      end)
      return true
    end,
  })
end

return {
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
      { '<leader>gg', '<cmd>DiffviewOpen<cr>', desc = 'Diff workspace changes' },
      { '<leader>gG', open_diff_view, desc = 'Diff with selected branch' },
      { '<leader>gF', '<cmd>DiffviewFileHistory %<cr>', desc = 'File history (this file)' },
      { '<leader>gf', '<cmd>DiffviewFileHistory<cr>', desc = 'File history' },
      { '<leader>gd', '<cmd>DiffviewClose<cr>', desc = 'Close diffview' },
    },
  },
}
