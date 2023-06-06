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
        noice = true,
        gitsigns = true,
        notify = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { 'undercurl' },
            hints = { 'undercurl' },
            warnings = { 'undercurl' },
            information = { 'undercurl' },
          },
        },
        navic = {
          enabled = true,
        },
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        alpha = true,
        mini = true,
        neotest = true,
        nvimtree = true,
        semantic_tokens = true,
        treesitter = true,
      },
      custom_highlights = function(colors)
        return {
          LeapBackdrop = { link = 'Comment' },
          DiffDelete = { bg = 'none', fg = colors.overlay0 },
          BlameLineNvim = { bg = 'none', fg = colors.surface1 },
        }
      end,
    },
  },
}
