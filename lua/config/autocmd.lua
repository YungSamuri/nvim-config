vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').zsh = {
      install_info = {
        url = 'https://github.com/georgeharker/tree-sitter-zsh',
        generate_from_json = false, -- only needed if repo does not contain `src/grammar.json` either
        queries = 'nvim-queries',   -- also install queries from given directory
      },
      tier = 3,
    }
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'bash', 'zsh', 'lua', 'javascript', 'typescript', 'css', 'superhtml', 'html', 'sql', 'json', 'yaml', 'dockerfile', 'python', 'go', },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})


vim.api.nvim_create_autocmd('User', {
  pattern = { 'TSUpdate' },
  callback = function()
    require('nvim-treesitter.parsers').hbsml = {
      install_info = {
        path = '~/.config/nvim/parsers/tree-sitter-hbsml/',
        queries = '~/.config/nvim/after/queries/hbsml/'
      }
    }
    require('nvim-treesitter.parsers').superhtml.install_info = {
      path = '~/.config/nvim/parsers/superhtml/tree-sitter-superhtml/',
      queries = '~/.config/nvim/after/queries/superhtml/'
    }
  end
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.hbs",
  callback = function()
    vim.bo.filetype = "superhtml"
  end,
})

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--
--     if not client then
--       return
--     end
--
--     if client.name == 'biome' then
--       vim.api.nvim_create_autocmd('BufWritePre', {
--         group = vim.api.nvim_create_augroup('BiomeFixAll', { clear = true }),
--         callback = function()
--           vim.lsp.buf.code_action({
--             context = {
--               only = { 'source.fixAll.biome' },
--               diagnostics = {},
--             },
--             apply = true,
--           })
--         end,
--       })
--     end
--   end,
-- })

vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint()
  end
})

-- Filetype tab size overrides
vim.api.nvim_create_autocmd('FileType', {
  pattern = "superhtml",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})
