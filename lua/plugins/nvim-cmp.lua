return {
  'hrsh7th/nvim-cmp',
  opts = function(_, opts)
    local cmp = require('cmp')
    opts.experimental.ghost_text = false
    opts.mapping = cmp.mapping.preset.insert({
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-l>'] = cmp.mapping.confirm({ select = true }),
    })
  end,
}
