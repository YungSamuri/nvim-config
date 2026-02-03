return {
  'mason-org/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  },
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      },
      omnisharp = {},
      bashls = {},
      html = {},
      cssls = {},
      ts_ls = {},
      sqlls = {},
      gdscript = {},
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = { 'E501', 'E203', 'W503' },
              }
            }
          }
        }
      },
      biome = {},
      gopls = {
        settings = {
          gopls = {
            buildFlags = { "-tags=integration" },
            env = { GOFLAGS = "-tags=integration" },
            --staticcheck = true,
            hints = {
              assignVariableTypes = true,
              parameterNames = true,
            },
          },
        },
      },
      postgrestools = {},
    },
  },
  config = function(_, opts)
    require('mason').setup()

    require('mason-lspconfig').setup({
      ensure_installed = { 'lua_ls', 'omnisharp', 'bashls', 'html', 'ts_ls', 'cssls', 'biome@1.9.4', 'sqlls', 'pylsp', 'gopls', }
    })
    for server, config in pairs(opts.servers) do
      vim.lsp.config(server, config)
      --vim.lsp.enable(server)
    end
  end
}
