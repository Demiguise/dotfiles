-- Allows us to check a module exists before requiring it, which is mega helpful
function moduleAvailable(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end

-- Default config
local cfg = {
  lsp_servers = {}
}

-- We can override the default configuration above by making
-- a local override lua file. This file just needs to return
-- a table that matches the default keys.
-- N.B. This might be overly simple and not recursive. It works
-- for now but might need alterations later to handle sub table changes
-- to defaults.
if moduleAvailable("local-override")
then
  local overrides = require("local-override")
  for k,v in pairs(overrides) do cfg[k] = v end
end

return cfg
