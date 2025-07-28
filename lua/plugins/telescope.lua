return {
  'nvim-telescope/telescope.nvim',
  keys = {
    { '<leader>sf', '<cmd>Telescope find_files<cr>' },
    { '<leader>sg', '<cmd>Telescope live_grep<cr>' }
  },
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('telescope').setup({
      defaults = {
        hidden = true,
        no_ignore = true,
      }
    })
  end,
}
