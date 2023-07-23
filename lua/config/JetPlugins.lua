local P = {
  -- Theme
  { 'yeomfa/jetly', dev = true },
  -- { 'yeomfa/buffar', dev = true },
  { 'yeomfa/eco', dev = true },

  'kyazdani42/nvim-web-devicons',

  -- Lualine
  'nvim-lualine/lualine.nvim',

  -- Bufferline
  'akinsho/bufferline.nvim',

  -- NvimTree
  { 'nvim-tree/nvim-tree.lua', tag = 'nightly' },

  -- Telescope
  { 'nvim-telescope/telescope.nvim', tag = '0.1.1' },

  -- Plenary
  'nvim-lua/plenary.nvim',

  -- Autopairs
  'windwp/nvim-autopairs',

  -- Autotag
  'windwp/nvim-ts-autotag',

  -- LSP Config
  'neovim/nvim-lspconfig',

  -- CMP
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'saadparwaiz1/cmp_luasnip',

  -- TreeSitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  -- Multicursor
  { 'mg979/vim-visual-multi', branch = 'master' },

  -- Colorizer
  'norcalli/nvim-colorizer.lua',

  -- Dashboard
  'glepnir/dashboard-nvim',

  -- LSP Kind
  'onsails/lspkind.nvim',

  -- CommentString
  'JoosepAlviste/nvim-ts-context-commentstring',

  -- GitSigns
  'lewis6991/gitsigns.nvim',

  -- Friendly Snippets
  'rafamadriz/friendly-snippets',

  -- Leap
  'ggandor/leap.nvim',

  -- Luasnip
  'L3MON4D3/LuaSnip',

  -- Commentary
  'tpope/vim-commentary',

  -- TODO Comments
  'folke/todo-comments.nvim',

  -- Toggleterm
  {'akinsho/toggleterm.nvim', version = "*", config = true},
}

return P
