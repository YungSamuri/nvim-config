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
    }
    if (unallowed[vim.bo.filetype]) then
      return
    end
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.hbs",
  callback = function()
    vim.bo.filetype = "html"
  end,
})
