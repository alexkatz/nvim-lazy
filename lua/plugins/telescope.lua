return {
  {
    'telescope.nvim',
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      config = function()
        require('telescope').load_extension('fzf')
      end,
    },

    opts = function(_, opts)
      local actions = require('telescope.actions')
      opts.defaults.mappings = {
        i = {
          ['<esc>'] = actions.close,
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<CR>'] = actions.select_default,
        },
      }
    end,
  },
}
