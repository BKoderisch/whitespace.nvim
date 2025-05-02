# whitespace.nvim

A small Neovim plugin to toggle and remove trailing whitespace.

## 🔧 Installation with lazy.nvim

```lua
{
  "BKoderisch/whitespace.nvim",
  config = function()
    local ws = require("whitespace")
    ws.setup({
        -- color = "Blue" -- sets the highlight color. Default value is DarkRed
        -- default_state = true -- sets default activation state
    })
    vim.keymap.set("n", "<leader>wt", ws.toggle_whitespace_highlight)
    vim.keymap.set("n", "<leader>wd", ws.remove_trailing_whitespace)
  end,
}
