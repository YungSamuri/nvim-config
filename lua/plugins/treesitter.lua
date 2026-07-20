return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install({
      'gdscript', 'godot_resource', 'gdshader', 'c_sharp', 'lua', 'c', 'vim', 'vimdoc', 'markdown', 'javascript',
      'css', 'typescript', 'sql', 'json', 'yaml', 'dockerfile', 'markdown_inline', 'bash', 'vue', 'gotmpl',
      'python', 'csv', 'superhtml', 'jsdoc', 'zsh', 'go', 'gomod', 'gosum', 'glimmer', 'kotlin', 'java', 'html'
    })
  end,
}
