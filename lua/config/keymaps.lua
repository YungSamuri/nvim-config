-----------------------------------------------------------
-- Normal Mode
-----------------------------------------------------------
-- Disable Space bar since it'll be used as the leader key
vim.keymap.set('n', '<leader>', '<nop>')

-- Redo remap
vim.keymap.set('n', 'U', '<C-r>')

-- Save and quit current file quicker
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { silent = false })
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { silent = false })

-- Reset the keybind to remove search highlights
vim.keymap.set('n', '<S-l>', ':noh<CR>')

-- Swap between split buffers
vim.keymap.set('n', '<C-Left>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-Right>', ':wincmd l<CR>')
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')

-- Save and quit current file quicker
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { silent = false })
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { silent = false })

-- Little one from Primeagen to mass replace string in a file
vim.keymap.set('n', '<leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = false })

-- Navigate through buffers
vim.keymap.set('n', '<S-Right>', ':bnext<CR>', { silent = false })
vim.keymap.set('n', '<S-Left>', ':bprevious<CR>', { silent = false })

-- Close currently active buffer
vim.keymap.set('n', '<C-c>', ':bwipeout<CR>', { silent = false })

-- Center buffer when navigating up and down
vim.keymap.set('n', '<S-Up>', '<C-u>zz')
vim.keymap.set('n', '<S-Down>', '<C-d>zz')

-- Center buffer when progressing through search results
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paste without replacing paste with what you are highlighted over
vim.keymap.set('n', '<leader>p', '"_dP')

-- Yank to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- Open buffer down or to the right
vim.keymap.set('n', '<leader>sd', ':split<CR>')
vim.keymap.set('n', '<leader>sr', ':vsplit<CR>')

-----------------------------------------------------------
-- Visual Mode
-----------------------------------------------------------
-- Disable Space bar since it'll be used as the leader key
vim.keymap.set('v', '<leader>', '<nop>')

-- Yank to system clipboard
vim.keymap.set('v', '<leader>y', '"+y')

-- Move selection up and down
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv")

vim.api.nvim_create_autocmd(
  'LspAttach',
  { --  Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc' -- Enable completion triggered by <c-x><c-o>

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', '<leader><space>', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

      vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format({ async = true })
      end, opts)

      -- Open the diagnostic under the cursor in a float window
      vim.keymap.set('n', '<leader>d', function()
        vim.diagnostic.open_float({
          border = 'rounded',
        })
      end, opts)
    end,
  }
)
