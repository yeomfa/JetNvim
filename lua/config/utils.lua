local U = {}
U.paths = {
  config = vim.fn.expand('~/.config/nvim/lua/config/JetConfigs.lua'),
  plugins = vim.fn.expand('~/.config/nvim/lua/config/JetPlugins.lua'),
  plugins_folder = vim.fn.expand('~/.config/nvim/lua/config/plugins/')
}

U.run_cmd = vim.api.nvim_command

function U.clear_cmdline()
  U.run_cmd('normal! :')
end

function U.jet_msg(msg)
  print('Jet msg: ' .. msg)
end

function U.get_plugins()
  local plugins = {}
  for _, file in ipairs(vim.fn.glob(U.paths.plugins_folder .. '*.lua', false, true)) do
    local plugin_name = vim.fn.substitute(file, '^.*/', '', '')
    table.insert(plugins, plugin_name:match('(.+)%..+$'))
  end
  return plugins
end

function U.get_index(table_arg, element)
  for i, e in ipairs(table_arg) do
    if table_arg[i] == element then
      return i
    end
  end
  return -1
end

return U
