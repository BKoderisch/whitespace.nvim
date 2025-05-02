local M = {}

local group = vim.api.nvim_create_augroup("WhiteSpaceGroup", { clear = true })
local enabled = false
local config = {
  color = "DarkRed",
  default_state = true,
}

function M.setup(opts)
  config = vim.tbl_deep_extend("force", config, opts or {})
  M.set_whitespace_highlight(config.default_state)
end

function M.set_whitespace_highlight(state)
  enabled = state
  vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = config.color })
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

function M.toggle_whitespace_highlight()
  M.set_whitespace_highlight(not enabled)
end

function M.remove_trailing_whitespace()
  local current_view = vim.fn.winsaveview()
  vim.cmd([[ %s/\s\+$//e ]])
  vim.fn.winrestview(current_view)
end

return M
