return {
  {
    'mbbill/undotree',
    config = function()
      vim.g.undotree_DiffAutoOpen = 0
    end,

    keys = {
      { '<leader>U', '<cmd>UndotreeToggle<cr>', desc = 'Toggle Undo Tree' },
    },
  },
}
