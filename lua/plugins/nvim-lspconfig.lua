return {
  {
    'neovim/nvim-lspconfig',
    init = function()
      local keys = require('lazyvim.plugins.lsp.keymaps').get()
      keys[#keys + 1] = { 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', desc = 'References' }
    end,

    opts = {
      servers = {
        tailwindcss = {
          root_dir = require('lspconfig.util').root_pattern('.git'),
          flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  { 'classed(?:\\.\\w*)?\\(([^)]*)\\)', '["\'`]([^"\'`]*).*?["\'`]' },
                  { 'clsx\\(([^)]*)\\)', "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  '(?:[a-z]ClassName)=\\s*(?:"|\')([^(?:"|\')]*)',
                },
              },
            },
          },
        },

        sumneko_lua = {
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },
  { import = 'lazyvim.plugins.extras.lang.typescript' },
  { import = 'lazyvim.plugins.extras.lang.json' },
}
