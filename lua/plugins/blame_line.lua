return {
  {
    'braxtons12/blame_line.nvim',
    config = {
      prefix = ' ',
    },
    init = function()
      require('blame_line').setup()
    end,
    keys = {
      { '<leader>ub', '<cmd>BlameLineToggle<cr>', desc = 'Toggle Blame Line' },
    },
  },
}
