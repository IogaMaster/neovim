return {
  'yaml',
  before = function()
    deps.add { source = 'mosheavni/yaml-companion.nvim' }
  end,
  after = function()
    -- Working with helm and kubernetes at work a LOT
    local cfg = require('yaml-companion').setup()
    vim.lsp.config('yamlls', cfg)
    vim.lsp.enable 'yamlls'
  end,
}
