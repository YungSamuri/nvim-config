return {
  'nvim-telescope/telescope.nvim',
  keys = {
    { '<leader>tf', '<cmd>Telescope find_files<cr>' },
    { '<leader>tg', '<cmd>Telescope live_grep<cr>' },
    { '<leader>tr', '<cmd>Telescope resume<cr>' },
  },
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('telescope').setup({
      defaults = {
        layout_strategy = 'flex',
        layout_config = {
          flip_columns = 160,
        },
      },
    })
  end,
}
