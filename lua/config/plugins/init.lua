local utils = require('config.utils')
local plugins = utils.get_plugins()

table.remove(plugins, utils.get_index(plugins, 'init'))
-- table.remove(plugins, utils.get_index(plugins, 'treesitter'))
-- table.remove(plugins, utils.get_index(plugins, 'bufferline'))

for _, plugin in ipairs(plugins) do
  if string.sub(plugin, 1, 3) == 'cs_' then
    require('config.plugins.' .. plugin)
    break
  end
end

for _, plugin in ipairs(plugins) do
  if string.sub(plugin, 1, 3) ~= 'cs_' then
    require('config.plugins.' .. plugin)
  end
end
