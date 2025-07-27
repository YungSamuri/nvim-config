vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function()
    local unallowed = { TelescopePreview=true, TelescopePrompt=true, TelescopeResults=true, NvimTree=true, ['blink-cmp-documentation']=true, ['blink-cmp-menu']=true, }
    if (unallowed[vim.bo.filetype]) then
      return
    end
    vim.treesitter.start()
  end,
})
