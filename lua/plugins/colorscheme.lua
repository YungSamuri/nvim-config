return {
  'cpea2506/one_monokai.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd [[colorscheme one_monokai]]
    require('one_monokai').setup({
      highlights = function(colors)
        return {
          ['@variable.glimmer'] = { link = 'Identifier' },
          ['@tag.delimiter.hbsml'] = { link = '' },
          ['@tag.delimiter.glimmer'] = { fg = colors.purple },
          ['@keyword.conditional.glimmer'] = { link = 'Keyword' },
          ['@function.glimmer'] = { fg = colors.orange },
        }
      end
    })
  end
}
