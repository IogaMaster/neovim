return {
  'lsp-zero.nvim',
  before = function()
    deps.add { source = 'VonHeikemen/lsp-zero.nvim', checkout = 'v4.x' }
    deps.add { source = 'neovim/nvim-lspconfig' }
    deps.add {
      source = 'hrsh7th/nvim-cmp',
      depends = {
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
      },
    }
    deps.add { source = 'L3MON4D3/LuaSnip', depends = { 'rafamadriz/friendly-snippets' } }
    deps.add { source = 'williamboman/mason.nvim' }
    deps.add { source = 'williamboman/mason-lspconfig.nvim' }
    deps.add { source = 'folke/lazydev.nvim' }
    deps.add { source = 'onsails/lspkind.nvim' }
    deps.add { source = 'deathbeam/lspecho.nvim' }
    deps.add { source = 'utilyre/barbecue.nvim', depends = { 'SmiteshP/nvim-navic' } }
    deps.add { source = 'stevearc/conform.nvim' }
    deps.add { source = 'mfussenegger/nvim-lint' }
    deps.add { source = 'ray-x/lsp_signature.nvim' }
    deps.add { source = 'mrcjkb/rustaceanvim' }
  end,
  after = function()
    local lsp_zero = require 'lsp-zero'

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

    lsp_zero.extend_lspconfig {
      sign_text = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»',
      },
      lsp_attach = lsp_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }

    local cmp = require 'cmp'
    local cmp_action = require('lsp-zero').cmp_action()
    require('lazydev').setup()

    cmp.setup {
      sources = {
        { name = 'nvim_lsp' },
        { name = 'lazydev', group_index = 0 },
      },
      snippet = {
        expand = function(args)
          -- You need Neovim v0.10 to use vim.snippet
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<CR>'] = cmp.mapping.confirm { select = false },
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
      },
      window = {
        completion = {
          winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
          col_offset = -3,
          side_padding = 0,
        },
      },
      formatting = {
        expandable_indicator = true,
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          local kind = require('lspkind').cmp_format { mode = 'symbol_text', maxwidth = 50 }(entry, vim_item)
          local strings = vim.split(kind.kind, '%s', { trimempty = true })
          kind.kind = ' ' .. (strings[1] or '') .. ' '
          kind.menu = '    (' .. (strings[2] or '') .. ')'

          return kind
        end,
      },
    }

    vim.diagnostic.config {
      virtual_text = true,
    }

    require('lspecho').setup {
      echo = true, -- Echo progress messages, if set to false you can use .message() to get the current message
      decay = 3000, -- Message decay time in milliseconds
    }

    require('mini.icons').setup()
    require('barbecue').setup()

    require('mason').setup {}
    require('mason-lspconfig').setup {
      ensure_installed = { 'lua_ls', 'nil_ls' },
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup {}
        end,
      },
    }

    require('conform').setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        nix = { 'alejandra' },
        rust = { 'rustfmt' },
        markdown = { 'mdformat' },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_md = 500,
      },
    }

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*',
      callback = function(args)
        require('conform').format { bufnr = args.buf }
      end,
    })

    -- lint
    require('lint').linters_by_ft = {
      nix = { 'statix' },
    }
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })

    require('lsp_signature').setup()

    require('mini.comment').setup()
  end,
}
