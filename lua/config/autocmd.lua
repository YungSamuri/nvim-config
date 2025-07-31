vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function()
    local unallowed = {
      TelescopePreview = true,
      TelescopePrompt = true,
      TelescopeResults = true,
      NvimTree = true,
      ['blink-cmp-documentation'] = true,
      ['blink-cmp-menu'] = true,
      lazy = true,
      lazy_backdrop = true,
      mason = true,
      mason_backdrop = true,
      harpoon = true,
      qf = true,
      tmux = true,
    }
    if (unallowed[vim.bo.filetype]) then
      return
    end
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})


vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').hbsml = {
      install_info = {
        path = '~/.config/nvim/parsers/tree-sitter-hbsml/',
        queries = '~/.config/nvim/after/queries/hbsml/'
      }
    }
  end
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.hbs",
  callback = function()
    vim.bo.filetype = "hbsml"
  end,
})
