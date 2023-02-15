return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    { 'roobert/tailwindcss-colorizer-cmp.nvim', config = true },
  },
  opts = function(_, opts)
    local cmp = require('cmp')
    opts.experimental.ghost_text = false
    opts.mapping = cmp.mapping.preset.insert({
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-l>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }),
      ['<Enter>'] = cmp.mapping.confirm({ select = true }),
      ---@diagnostic disable-next-line: missing-parameter
      ['<C-space>'] = cmp.mapping.complete(),
    })

    -- tailwind colors
    local format_kinds = opts.formatting.format
    opts.formatting.format = function(entry, item)
      format_kinds(entry, item) -- add icons
      return require('tailwindcss-colorizer-cmp').formatter(entry, item)
    end
  end,
}
