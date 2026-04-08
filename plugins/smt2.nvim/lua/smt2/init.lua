local M = {}

M.config = {}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})

  -- Register nvim-cmp source if cmp is available
  local ok, cmp = pcall(require, "cmp")
  if ok then
    cmp.register_source("smt2", require("smt2.cmp").new())
  end
end

--- Omnifunc for smt2 buffers (works without nvim-cmp)
function M.omnifunc(findstart, base)
  local items = require("smt2.complete").items

  if findstart == 1 then
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local start = col
    while start > 0 and line:sub(start, start):match("[%w%-%._:+*/<>=!?]") do
      start = start - 1
    end
    return start
  end

  local matches = {}
  local prefix = base:lower()
  for _, item in ipairs(items) do
    if item.label:lower():sub(1, #prefix) == prefix then
      table.insert(matches, {
        word = item.label,
        kind = item.detail or "",
        menu = "[smt2]",
      })
    end
  end
  return matches
end

return M
