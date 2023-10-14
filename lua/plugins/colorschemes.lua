return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    opts = {
      flavour = 'macchiato', -- latte, frappe, macchiato, mocha
      term_colors = false,
      dim_inactive = {
        enabled = true,
        shade = 'dark',
        percentage = 0.20,
      },
      no_italic = true,
      integrations = { barbecue = { alt_background = true } },
      custom_highlights = function(colors)
        return {
          DiffDelete = { bg = 'none', fg = colors.overlay0 },
          BlameLineNvim = { bg = 'none', fg = colors.surface1 },
          Folded = { bg = 'none' },
        }
      end,
    },
  },
}
