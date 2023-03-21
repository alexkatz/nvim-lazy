return {
  {
    'braxtons12/blame_line.nvim',
    config = {
      prefix = ' ',
    },
    init = function()
      require('blame_line').disable()
    end,
    keys = {
      { '<leader>ub', '<cmd>BlameLineToggle<cr>', desc = 'Toggle Blame Line' },
    },
  },
}
