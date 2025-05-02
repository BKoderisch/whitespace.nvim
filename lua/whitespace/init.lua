local M = {}

local group = vim.api.nvim_create_augroup("WhiteSpaceGroup", { clear = true })
local enabled = true

function M.toggle_whitespace_highlight()
  enabled = not enabled
  vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = "DarkRed" })
  if enabled then
    vim.api.nvim_create_autocmd("BufEnter", {
      group = group,
      pattern = "*",
      callback = function()
        vim.cmd("match TrailingWhitespace /\\s\\+$/")
      end,
    })
    vim.cmd("match TrailingWhitespace /\\s\\+$/")
  else
    vim.cmd("match none")
  end
end

function M.remove_trailing_whitespace()
  local current_view = vim.fn.winsaveview()
  vim.cmd([[ %s/\s\+$//e ]])
  vim.fn.winrestview(current_view)
end

return M
