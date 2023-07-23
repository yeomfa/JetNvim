local nvim_config_dir = os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config") .. "/nvim"
local plugins_file_path = nvim_config_dir .. "/lua/config/JetPlugins.toml"
local cache_file_path = nvim_config_dir .. "/.cache/jet_plugins.lua"

local function read_file(path)
  local file = io.open(path, "r")
  if not file then
    return nil, "Error reading file in " .. path
  end
  local content = file:read("*all")
  file:close()
  return content
end

local function save_cache(plugins, modification_time)
  local file = io.open(cache_file_path, "w")
  local config = {
    plugins = plugins,
    last_modification_time = modification_time
  }
  file:write("return " .. vim.inspect(config))
  file:close()
end

local function parse_toml(content)
  local plugs = {}

  for line in content:gmatch("[^\r\n]+") do
    local plugin_name = line:match('^%s*"([^"]+)"%s+=')

    if plugin_name then
      local enabled = line:match('enabled%s*=%s*(%a+)')
      if enabled == "true" then
        local plugin = {plugin_name}
        for attribute, quote, value in line:gmatch('([%w_]+)%s*=%s*([\'"]?)([^,%s]+)%2') do
          print(value)
          if attribute ~= "enabled" then
            if quote ~= "" then
              plugin[attribute] = value
            elseif value == "true" or value == "false" then
              plugin[attribute] = value == "true"
            else
              plugin[attribute] = tonumber(value) or value
            end
          end
        end
        table.insert(plugs, plugin)
      end
    end
  end

  return plugs
end

local function get_ftime(path)
  local mod_time = vim.loop.fs_stat(path)
  local mod_time_sec = mod_time.mtime.sec
  return mod_time_sec
end

local function parse_cache(content)
  content = content:gsub("%s+", ""):gsub("}%s+,{", "},{")
  local plugs = load("return ".. content)()
  return plugs
end

local function charge_toml_plugins_file()
  local plugins, status = read_file(plugins_file_path) 
  if plugins then
    local plugins_table = parse_toml(plugins)
    save_cache(plugins_table, get_ftime(plugins_file_path))
    print('Readed from plugins file');
    return plugins_table
  else
    print(status)
  end
end

local cache, status = read_file(cache_file_path) 
if cache then  
  local config = dofile(cache_file_path)
  local last_mod_act = get_ftime(plugins_file_path)
  local last_mod = tonumber(config.last_modification_time)

  if last_mod < last_mod_act then
    charge_toml_plugins_file()
    print('File .toml modified')
  else
    local plugins_table = dofile(cache_file_path).plugins
    print('Readed from cache file');
    return plugins_table
  end
else
  charge_toml_plugins_file()
end
