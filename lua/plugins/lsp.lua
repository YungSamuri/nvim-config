return {
  {
    'mason-org/mason.nvim',
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'omnisharp', 'bashls', 'html', 'ts_ls', 'cssls', 'biome@1.9.4', 'sqlls', 'pylsp', 'gopls', 'kotlin_lsp' }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
              },
            },
          },
        },
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
        gopls = {
          settings = {
            gopls = {
              buildFlags = { "-tags=unit,integration" },
              --env = { GOFLAGS = "-tags=integration" },
              --staticcheck = true,
              hints = {
                assignVariableTypes = true,
                parameterNames = true,
              },
            },
          },
        },
        sqlls = {
          settings = {
            sqlLanguageServer = {
              lint = {
                rules = {
                  ["linebreak-after-clause-keyword"] = "off"
                }
              }
            }
          }
        }
      }

      for server, config in pairs(servers) do
        vim.lsp.config(server, config)
      end
      vim.keymap.set("n", "<leader>i", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, {})
    end
  },
}
