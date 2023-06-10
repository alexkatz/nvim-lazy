return {
  'folke/edgy.nvim',
  opts = {
    left = {
      {
        title = 'Neo-Tree',
        ft = 'neo-tree',
        filter = function(buf)
          return vim.b[buf].neo_tree_source == 'filesystem'
        end,
        pinned = true,
        open = function()
          vim.api.nvim_input('<esc><space>e')
        end,
        size = { height = 1 },
      },
    },
    right = {
      {
        ft = 'Outline',
        size = { height = 1 },
        open = 'SymbolsOutline',
      },
    },
  },
}
