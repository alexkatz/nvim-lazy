return {
  {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup({
        style = 'night',
        styles = {
          functions = {},
        },
      })
    end,
  },
  { dir = '~/Developer/arctic.nvim', dependencies = { 'rktjmp/lush.nvim' } },
}
