-- @TODO: breakup into separate modules

return {
  -- highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require('nvim-treesitter.configs')
      configs.setup({
        -- ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'query', 'python', 'javascript', 'html' },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = {'nvim-treesitter/nvim-treesitter'},
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = {'nvim-treesitter/nvim-treesitter'},
  },

  -- git-related plugins
  {'tpope/vim-fugitive'},
  {'tpope/vim-rhubarb'},
  {'lewis6991/gitsigns.nvim'},

  -- lsp configuration & plugins
  {
    'vonheikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- lsp support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',

      -- misc
      'j-hui/fidget.nvim',
    },
  },

  -- fancy theme
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- other plugins
  {'nvim-lualine/lualine.nvim'},  -- fancy status line
  {'mbbill/undotree'},            -- visual undo tree
  {'numToStr/Comment.nvim'},      -- 'gc' to comment visual regions/lines
  {'tpope/vim-sleuth'},           -- detect tabstop and shiftwidth automatically

  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
  },

  -- navigation tree
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
      vim.keymap.set('n', '<c-b>', ':Neotree toggle<cr>')
      require('neo-tree').setup({
        close_if_last_window = true,
        enable_git_status = true,
        enable_diagnostics = true,
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw_behavior = "open_default"
      })
    end,
  },

  -- welcome screen
  {
    'goolord/alpha-nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end,
  },
}