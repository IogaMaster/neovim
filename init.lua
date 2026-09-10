-- Install lz.n (lazy loading api)
vim.pack.add { { src = 'https://github.com/lumen-oss/lz.n' } }

-- These must be here for it to package with Nix.
require 'options'
require 'keymaps'
require 'colorscheme'

require 'pack'
require('lz.n').load 'plugins'

-- Remove all installed plugins that are not declared!!!
-- Otherwise we would leave crap in the neovim path
pcall(function()
  vim.pack.del(vim.tbl_map(function(p)
    return (not p.active and p.spec) and p.spec.name
  end, vim.pack.get()))
end)
