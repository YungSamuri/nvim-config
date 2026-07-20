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
          ['@tag.delimiter.hbsml'] = { link = '' },
          ['@punctuation.bracket.superhtml'] = { link = '' },

          ['@variable.glimmer'] = { link = 'Identifier' },
          ['@tag.delimiter.glimmer'] = { fg = colors.purple },
          ['@keyword.conditional.glimmer'] = { link = 'Keyword' },
          ['@function.glimmer'] = { fg = colors.orange },

          ['@tag.delimiter.html'] = { link = '' },
          ['@tag.attribute.html'] = { link = 'Type' },

          ['@variable.member.gotmpl'] = { link = 'Identifier' },
          ['@punctuation.bracket.gotmpl'] = { fg = colors.purple },
          ['@keyword.directive.gotmpl'] = { link = 'Keyword' },
          ['@keyword.repeat.gotmpl'] = { link = 'Keyword' },
          ['@keyword.conditional.gotmpl'] = { link = 'Keyword' },
          ['@function.gotmpl'] = { fg = colors.orange },
          ['@function.builtin.gotmpl'] = { fg = colors.orange },
        }
      end
    })
  end,
  cache = {
    path = vim.fs.joinpath(vim.fn.stdpath("cache"), "testing")
  }
}
