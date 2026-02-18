-----------------------------------------------------------
-- General
-----------------------------------------------------------
-- Set leader key to space
vim.g.mapleader          = ' '
-- Set leader key to space
vim.g.maplocalleader     = ' '

-- Number of spaces a tab represents
vim.opt.tabstop          = 2
vim.opt.softtabstop      = 2

-- Use appropriate when using indent command
vim.opt.expandtab        = true
vim.opt.shiftwidth       = 2

-- Indenting correctly after { etc
vim.opt.smartindent      = true

-- Copy indent from current line when starting new line
vim.opt.autoindent       = true

-- Speeds up plugin wait time
vim.opt.updatetime       = 50

-- Persistant undo file history
vim.opt.undofile         = true

-- Disable default file explorer
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- Notify neovim that a nerd font is installed
vim.g.have_nerd_font     = true

-- Set folds to all open by default
vim.opt.foldlevelstart = 99

-----------------------------------------------------------
-- UI Config
-----------------------------------------------------------
-- Enable line numbers
vim.opt.nu               = true

-- Enable relative line numbers
vim.opt.rnu              = true

-- Put relative and regular line number in the same column
vim.opt.numberwidth      = 1

-- Enable cursor line highlight
vim.opt.cursorline       = true

-- Better completion experience
vim.opt.completeopt      = { 'menuone', 'noselect' }

-- Enable 24-bit color
vim.opt.termguicolors    = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn       = 'yes'

-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff        = 10

-- Better splitting
vim.opt.splitbelow       = true
vim.opt.splitright       = true

-- Faster scrolling
vim.opt.lazyredraw       = true

-- Highlight yank
vim.api.nvim_create_autocmd('textyankpost', {
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
  pattern = '*',
  desc = 'highlight selection on yank',
  callback = function()
    vim.highlight.on_yank({ timeout = 200, visual = true })
  end,
})

-- Show folds on the left
vim.opt.foldcolumn = 'auto:9'

-----------------------------------------------------------
-- Search Config
-----------------------------------------------------------
-- Enable highlighting search in progress
vim.opt.incsearch = true

-- Ignore case for searches
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Diagnostic display inline
vim.diagnostic.config({
  virtual_text = true,
  underline = true
})
