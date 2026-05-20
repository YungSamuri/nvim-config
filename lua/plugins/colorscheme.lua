return {
  'cpea2506/one_monokai.nvim',
  lazy = false,
  priority = 1000,
  commit = '4758657884186c9420e49b80e704dd4db7023ed0',
  config = function()
    vim.cmd [[colorscheme one_monokai]]
    require('one_monokai').setup({
      highlights = function(colors)
        return {
          ['@variable.glimmer'] = { link = 'Identifier' },
          ['@tag.delimiter.hbsml'] = { link = '' },
          ['@punctuation.bracket.superhtml'] = { link = '' },
          ['@tag.delimiter.glimmer'] = { fg = colors.purple },
          ['@keyword.conditional.glimmer'] = { link = 'Keyword' },
          ['@function.glimmer'] = { fg = colors.orange },
        }
      end
    })
  end,
  cache = {
    path = vim.fs.joinpath(vim.fn.stdpath("cache"), "testing")
  }
}
