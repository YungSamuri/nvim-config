return {
  'cpea2506/one_monokai.nvim',
  config = function()
    require('one_monokai').setup({
      vim.cmd [[colorscheme one_monokai]],
      transparent = true,
    })
  end
}
