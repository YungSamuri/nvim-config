return {
  {
    'saghen/blink.compat',
    version = '2.*',
    lazy = true,
    opts = {},
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      {
        'rafamadriz/friendly-snippets'
      },
      {
        "MattiasMTS/cmp-dbee",
        dependencies = {
          "kndndrj/nvim-dbee"
        },
        branch = 'ms/v2',
        ft = { 'sql' },
        opt = {},
      }
    },

    version = '1.*',

    opts = {
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        preset = 'super-tab',
        ['<C><leader>'] = { 'show' },
      },

      appearance = {
        nerd_font_variant = 'mono'
      },

      completion = { documentation = { auto_show = true } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        per_filetype = {
          sql = { 'dbee', 'buffer' }
        },
        providers = {
          dbee = {
            name = 'dbee',
            module = 'blink.compat.source'
          },
        },
      },

      fuzzy = { implementation = 'prefer_rust_with_warning' }
    },
    opts_extend = { 'sources.default' }
  }
}
