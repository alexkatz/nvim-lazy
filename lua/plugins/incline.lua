return {
  'b0o/incline.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'mini.icons' },
  config = function()
    require('incline').setup({
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      render = function(props)
        local lazy_icons = LazyVim.config.icons
        local mini_icons = require('mini.icons')
        local macchiato = require('catppuccin.palettes').get_palette('macchiato')
        local U = require('catppuccin.utils.colors')

        local function get_filename()
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':.')
          if filename == '' then
            filename = '[No Name]'
          end
          local ft_icon, ft_color = mini_icons.get('file', filename)

          local modified_icon = {}

          if vim.api.nvim_get_option_value('modified', { buf = props.buf }) then
            modified_icon = { '● ', guifg = macchiato.yellow }
          end

          return {
            ' ',
            modified_icon,
            ft_icon and { ft_icon, ' ', guibg = 'none', group = ft_color } or '',
            { filename, gui = props.focused and 'bold' or 'none' },
            ' ',
          }
        end

        local function get_diagnostics()
          local icons = {
            error = lazy_icons.diagnostics.Error,
            warn = lazy_icons.diagnostics.Warn,
            info = lazy_icons.diagnostics.Info,
            hint = lazy_icons.diagnostics.Hint,
          }
          local labels = {}

          for severity, icon in pairs(icons) do
            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
            if n > 0 then
              table.insert(labels, { ' ' .. icon .. n, group = 'DiagnosticSign' .. severity })
            end
          end
          if #labels > 0 then
            table.insert(labels, { ' ┊' })
          end
          return labels
        end

        local function get_mini_diff()
          local icons = {
            add = lazy_icons.git.added,
            change = lazy_icons.git.modified,
            delete = lazy_icons.git.removed,
          }
          local signs = vim.b[props.buf].minidiff_summary

          local labels = {}
          if signs == nil then
            return labels
          end
          for name, icon in pairs(icons) do
            if tonumber(signs[name]) and signs[name] > 0 then
              table.insert(labels, { ' ', icon .. signs[name], group = 'MiniDiffSign' .. name })
            end
          end
          if #labels > 0 then
            table.insert(labels, { ' 󰊢 ' .. signs.n_ranges .. ' ┊' })
          end
          return labels
        end

        local winid = vim.api.nvim_get_current_win() -- Get the current window ID
        local cursor_position = vim.api.nvim_win_get_cursor(winid)
        local cursor_line = cursor_position[1]
        local cursor_at_top = cursor_line == 1

        local darkened_mantle = U.darken(macchiato.base, 0.15, macchiato.mantle)
        local lightened_mantle = U.darken(macchiato.surface0, 0.64, macchiato.base)

        local chev_bg = darkened_mantle

        if cursor_at_top and props.focused then
          chev_bg = lightened_mantle
        end

        if not cursor_at_top and props.focused then
          chev_bg = macchiato.base
        end

        return {
          {
            '',
            guifg = props.focused and macchiato.surface0 or darkened_mantle,
            guibg = chev_bg,
          },
          { get_diagnostics() },
          { get_mini_diff() },
          { get_filename() },
          -- group = props.focused and 'ColorColumn' or 'FloatTitle',
          guifg = props.focused and macchiato.text or macchiato.overlay2,
          guibg = props.focused and macchiato.surface0 or darkened_mantle,
        }
      end,
    })
  end,
}
