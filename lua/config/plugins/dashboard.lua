--vim.g.indentLine_fileTypeExclude = { 'dashboard' }
local status, dash = pcall(require, "dashboard")
if not status then return end

dash.setup({
  theme = 'hyper',
  config = {
    preview = {
    },
    header = { "", "", "", "",
            "",
            "       ███     ",
            "               ",
            "               ",
            "   ████ NVIM   ",
            "",
            "",
    },
    footer = {"", "", '🚀 v0.0.0' },
    project = { enable = false },
    mru = { limit = 5 },
    packages = {
      enable = false,
    },
    disable_move = true,
    shortcut = {
      { 
        icon = '',
        desc = ' Update',
        action = 'Lazy update',
        key = 'u',
      },
      {
        icon = '',
        desc = ' Files',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        icon = '󰙅',
        desc = ' Tree',
        action = 'NvimTreeToggle',
        key = 't',
      },
      {
        icon = '',
        desc = ' Quit',
        action = 'q',
        key = 'q',
      },
    },
  },
})

-- load_header = { "", "", "", "", "",
--         "",
--         "",
--         "    ▀██▀      ██        ",
--         "     ██ ██▀▀█ ██▀▀      ",
--         "    ██ ██▀▀▀ ██       ",
--         "   █▄██ ██▄▄▄ ██▄▄ Nvim ",
--         "",
--         "",
-- }

-- dash.custom_header = load_header

-- dash.custom_center = {
--   {
--     icon = "  ",
--     desc = "Find files      ",
--     shortcut = " SPC ff ",
--     action = "Telescope find_files",
--   },
-- 	{
-- 		icon = "  ",
-- 		desc = "Recent files    ",
-- 		shortcut = " SPC fr ",
-- 		action = "Telescope oldfiles",
-- 	},
-- 	{
-- 		icon = "פּ  ",
-- 		desc = "Open tree       ",
-- 		shortcut = " SPC e  ",
-- 		action = "NvimTreeToggle",
-- 	},
-- 	{
-- 		icon = "  ",
-- 		desc = "Exit            ",
-- 		shortcut = " SPC q  ",
-- 		action = "q",
-- 	},
-- } 

-- dash.custom_footer = {"", "", " Hello Jet!", "", "v0.0.0"}
