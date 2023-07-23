local status, jetly = pcall(require, 'jetly')
if not status then return end

-- vim.g.jetly_variant = "darksic"
-- vim.g.jetly_transparent = true
-- vim.g.jetly_telescope = false

vim.cmd[[colorscheme jetly]]
