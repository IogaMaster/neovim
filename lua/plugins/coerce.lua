return {
  'coerce.nvim',
  before = function()
    deps.add { source = 'gregorias/coerce.nvim', depends = { 'gregorias/coop.nvim' } }
  end,
  keys = {
    { 'cr', '<Plug>(coerce-normal)', desc = 'Coerce word' },
    { 'gcr', '<Plug>(coerce-motion)', desc = 'Coerce motion' },
    { 'gcr', '<Plug>(coerce-visual)', desc = 'Coerce visual', mode = 'x' },
  },
  after = function()
    require('coerce').setup()
    local wke = require('coerce.keymaps').which_key_expand
    require('which-key').add {
      { 'cr', group = '+Coerce word', expand = wke.normal_mode, mode = 'n' },
      { 'gcr', group = '+Coerce motion', expand = wke.motion_mode, mode = 'n' },
      { 'gcr', group = '+Coerce visual', expand = wke.visual_mode, mode = 'x' },
    }
  end,
}
