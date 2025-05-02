# nvim-whitespace-toggle

A small Neovim plugin to toggle and remove trailing whitespace.

## 🔧 Installation (with lazy.nvim)

```lua
{
  "BKoderisch/whitespace.nvim",
  config = function()
    local ws = require("whitespace")
    vim.keymap.set("n", "<leader>wt", ws.toggle, { desc = "Toggle trailing whitespace highlight" })
    vim.keymap.set("n", "<leader>wd", ws.strip, { desc = "Remove trailing whitespace" })
  end,
}
