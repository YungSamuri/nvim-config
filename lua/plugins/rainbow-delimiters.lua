return {
  'hiphish/rainbow-delimiters.nvim',
  config = function()
    require('rainbow-delimiters.setup').setup({
      query = {
        html = 'rainbow-tag-names'
      }
    })
  end

}
