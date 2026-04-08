local source = {}

function source.new()
  return setmetatable({}, { __index = source })
end

function source:get_keyword_pattern()
  return [[\%([%w%-%._:+*/<>=!?]\+\)]]
end

function source:is_available()
  return vim.bo.filetype == "smt2"
end

function source:get_trigger_characters()
  return { "(", ":", ".", "-" }
end

function source:complete(params, callback)
  local items = require("smt2.complete").items
  local result = {}

  for _, item in ipairs(items) do
    table.insert(result, {
      label = item.label,
      kind = item.kind,
      detail = item.detail,
      documentation = item.doc,
    })
  end

  callback({ items = result })
end

return source
