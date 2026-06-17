return {
  'lsp-zero.nvim',
  pkgs = {
    { src = 'https://github.com/VonHeikemen/lsp-zero.nvim', checkout = 'v4.x' },
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'folke/lazydev.nvim',
    'onsails/lspkind.nvim',
    'deathbeam/lspecho.nvim',
    'utilyre/barbecue.nvim',
    'SmiteshP/nvim-navic',
    'stevearc/conform.nvim',
    'mfussenegger/nvim-lint',
    'ray-x/lsp_signature.nvim',
    'mrcjkb/rustaceanvim',
    'Goose97/timber.nvim',
    'danymat/neogen',
    'ray-x/go.nvim',
    'Massolari/lsp-auto-setup.nvim',
  },
  event = 'BufReadPost',
  after = function()
    local lsp_zero = require 'lsp-zero'

    -- 1. Global LSP Keybindings
    local lsp_attach = function(client, bufnr)
      local opts = { buffer = bufnr }
      vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      vim.keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end

    -- 2. Extend Global Configurations
    lsp_zero.extend_lspconfig {
      sign_text = {
        error = '✘',
        warn = '',
        hint = '',
        info = '',
      },
      lsp_attach = lsp_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }

    -- 3. Manual Language Server Configurations (No Mason)
    local lspconfig = require('lspconfig')

    -- Fix nil_ls issue by targeting the correct nix binary name: 'nil'
    if vim.fn.executable('nil') == 1 then
      lspconfig.nil_ls.setup({})
    end

    -- Example fallback setups for other common languages
    -- (Add or remove based on binaries installed via Nix)
    local local_servers = { 'lua_ls', 'gopls', 'pyright', 'ts_ls' }
    for _, server in ipairs(local_servers) do
      if lspconfig[server] then
        lspconfig[server].setup({})
      end
    end

    -- 4. Autocomplete (nvim-cmp) & Snippets Configuration
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    -- Load friendly-snippets framework
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
      mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
    })
  end
}
