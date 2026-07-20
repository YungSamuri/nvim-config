return {
  'hiphish/rainbow-delimiters.nvim',
  config = function()
    require('rainbow-delimiters.setup').setup({
      query = {
        hbsml = 'rainbow-tag-names',
        superhtml = 'rainbow-tag-names',
        html = 'rainbow-tag-names',
      }
    })
  end

}
