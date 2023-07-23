local C = {}
local utils = require('config.utils')
local default_ext = '.lua'

function C.get_options(lead)
  local plugin_list = utils.get_plugins()
  local options = {}

  if lead ~= "" then
    local exp = '^' .. lead 
    for _, plugin in pairs(plugin_list) do
      if plugin:match(exp) then
        table.insert(options, plugin)
      end
    end
    return options
  else
    return plugin_list
  end
end

function C.configs()
  local cmd = 'e ' .. utils.paths.config
  return cmd 
end

function C.config_plugin(plugin)
  local plugin_name = plugin

  if plugin:match('^.+(%..+)$') then
    if not plugin:match('%.lua$') then
      utils.jet_msg('Please enter a valid plugin filename ending in .lua')
      return
    else
      plugin_name = plugin:match('(.+)%..+$')  
    end
  end

  local cmd = 'e '.. utils.paths.plugins_folder .. plugin_name .. default_ext
  utils.run_cmd(cmd)
end

function C.plugins()
  local cmd = 'e ' .. utils.paths.plugins 
  return cmd 
end

function C.remove_plugin(plugin)
  local plugin_name = plugin
  local rm = 'n'
  local pluging_ext = plugin:match('^.+(%..+)$')

  if pluging_ext then
    if pluging_ext ~= default_ext then
      utils.jet_msg('Just enter the file name or with extension .lua!')
      return
    else
      plugin_name = plugin:match('(.+)%..+$')
    end
  end

  local input = vim.fn.input({
    prompt = 'Remove plugin ' .. plugin_name .. ' ? y/N:'
  })

  rm = input
  vim.cmd('redraw')
  if rm == 'y' or rm == 'Y' then
    local local_path = utils.paths.plugins_folder .. plugin_name .. default_ext
    local _, status = pcall(vim.fn.delete, local_path)
    local msg = ''
    if status == -1 then
      msg = 'The file could not be deleted or does not exist!'
    else
      msg = 'The file was deleted!'
    end
    utils.jet_msg(msg)
  else
    utils.jet_msg('Cancelled!')
  end
end

function C.in_dev()
  return 'echo "In dev"'
end

function C.update_config()
  local git_url = "https://github.com/yeomfa/JetNvim.git"
  local nvim_config_dir = vim.fn.stdpath("config")
  local cmd = "git clone " .. git_url .. " " .. nvim_config_dir .. "/tmp-config && cp -rf " .. nvim_config_dir .. "/tmp-config/* " .. nvim_config_dir .. " && rm -rf " .. nvim_config_dir .. "/tmp-config"
  return 'echo "'.. cmd .. '"'
end

return C
