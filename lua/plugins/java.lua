return {
  {
    'nvim-java/nvim-java',
    config = function()
      require('java').setup({
        -- jdtls = {
        --   initializationOptions = {
        --     workspaceFolder = {
        --       "file:///home/hdsmith/tutorials/interpreter/jlox/"
        --     }
        --   }
        -- }
      })
    end,
  }
}
