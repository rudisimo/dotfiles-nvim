local lazy = {}

-- configure installation path for lazy.nvim
lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim ...')
    vim.fn.system({
      'git',
      'clone',
      '--depth=1',
      '--branch=stable',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      path,
    })
    print('Done.')
  end
end

function lazy.setup(opts)
  lazy.install(lazy.path)
  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(opts)
end

-- setup custom configuration
lazy.setup({
  spec = 'rudisimo.plugins',
  -- install missing plugins on startup
  install = { missing = true },
  -- check for config file changes
  change_detection = { enabled = true, notify = false },
})