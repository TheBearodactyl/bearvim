local M = {}

function M.add_plugin(plugin_spec)
  table.insert(bearvim.plugins, plugin_spec)
end

function M.remove_plugin(plugin_name)
  for i, plugin in ipairs(bearvim.plugins) do
    if plugin[1] == plugin_name then
      table.remove(bearvim.plugins, i)
      break
    end
  end
end

function M.edit_plugin(plugin_name, new_spec)
  for i, plugin in ipairs(bearvim.plugins) do
    if plugin[1] == plugin_name then
      bearvim.plugins[i] = new_spec
      break
    end
  end
end

return M
