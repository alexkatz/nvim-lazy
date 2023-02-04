return {
  {
    -- better quickfix window
    'kevinhwang91/nvim-bqf',

    dependencies = {
      -- for fzf functionality within
      {
        'junegunn/fzf',
        build = function()
          vim.fn['fzf#install']()
        end,
      },
    },

    opts = {
      preview = {
        win_height = 30,
      },
    },

    config = function(_, opts)
      require('bqf').setup(opts)
    end,
  },
}
