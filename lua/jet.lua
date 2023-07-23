require("config")
local jet_funcs = require("config.funcs")
local cmd = vim.api.nvim_create_user_command
local opts = {
  nargs = 1,
  complete = function(lead)
    return jet_funcs.get_options(lead)
  end
}

cmd('JetConfigs', jet_funcs.configs(), {})

cmd('JetConfigPlugin', function(opts)
 jet_funcs.config_plugin(unpack(opts.fargs))
end, opts)

cmd('JetPlugins', jet_funcs.plugins(), {})

cmd('JetRemovePlugin', function(opts)
 jet_funcs.remove_plugin(unpack(opts.fargs))
end, opts)

cmd('JetUpdate', jet_funcs.update_config(), {})
