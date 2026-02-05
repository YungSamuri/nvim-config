return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require("dbee").install()
  end,
  config = function()
    local dbee = require("dbee")
    dbee.setup( --[[optional config]])

    -- Keybind
    vim.keymap.set("n", "<Leader>bo", dbee.open, { desc = "Open Dbee" })
    vim.keymap.set("n", "<Leader>bc", dbee.close, { desc = "Close Dbee" })
    vim.keymap.set("n", "<Leader>bt", dbee.toggle, { desc = "Toggle Dbee" })
  end,
}
