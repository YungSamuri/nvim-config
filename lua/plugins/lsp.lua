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
      eslint = {},
      glint = {},
      sqlls = {},
      gdscript = {},
      pythonlsp = {},
    },
  },
  config = function(_, opts)
    require('mason').setup()

    require('mason-lspconfig').setup({
      ensure_installed = { 'lua_ls', 'omnisharp', 'bashls', 'html', 'ts_ls', 'cssls', 'eslint', 'sqlls', 'glint', 'pylsp', }
    })

    local lspconfig = require('lspconfig')
    lspconfig.gdscript.setup({})
    for server, config in pairs(opts.servers) do
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
      lspconfig[server].setup(config)
    end
  end
}
