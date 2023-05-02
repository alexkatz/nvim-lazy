return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    opts = {
      flavour = 'macchiato', -- latte, frappe, macchiato, mocha
      transparent_background = false,
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = false,
      dim_inactive = {
        enabled = true,
        shade = 'dark',
        percentage = 0.15,
      },
      no_italic = true, -- Force no italic
      no_bold = false, -- Force no bold
      integrations = {
        cmp = true,
        leap = true,
        neotree = true,
        ts_rainbow = true,
        telescope = true,
        lsp_trouble = true,
        illuminate = true,
        which_key = true,
        navic = true,
        noice = true,
        gitsigns = true,
        notify = true,
      },
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
        },
      },
      navic = {
        enabled = false,
        custom_bg = 'NONE',
      },
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      custom_highlights = function(colors)
        return {
          LeapBackdrop = { link = 'Comment' },
          DiffDelete = { bg = 'none', fg = colors.overlay0 },
        }
      end,
    },
  },
}
