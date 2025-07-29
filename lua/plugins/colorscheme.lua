return {
  'cpea2506/one_monokai.nvim',
  config = function()
    vim.cmd [[colorscheme one_monokai]]
    require('one_monokai').setup({
      highlights = function(colors)
        return {
          ['@variable.glimmer'] = { link = 'Identifier' },
          ['@tag.delimiter.html'] = { link = '' },
          ['@keyword.conditional.glimmer'] = { link = 'Keyword' },
          ['@function.glimmer'] = { fg = colors.orange },
        }
      end
    })
  end
}
