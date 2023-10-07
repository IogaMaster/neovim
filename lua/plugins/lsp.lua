return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'onsails/lspkind.nvim' },
    { 'folke/neodev.nvim' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },

    -- Esthetic
    { 'folke/trouble.nvim' },

    -- Misc
    {
      'stevearc/conform.nvim',
    },

    -- Flutter
    {
      'akinsho/flutter-tools.nvim',
      lazy = false,
      dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
      },
      config = true,
    },
  },
  config = function()
    local lsp = require 'lsp-zero'

    require('neodev').setup {}

    lsp.preset 'recommended'
    lsp.nvim_workspace()
    lsp.set_preferences {
      sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»',
      },
    }

    -- Configure Servers

    lsp.setup_servers {
      'lua_ls',
      'rust_analyzer',
      'zls',
      'tsserver',
      'clangd',
      'tailwindcss',
      'dartls',
      'gopls',
    }

    require('lspconfig').nil_ls.setup {
      settings = {
        ['nil'] = {
          nix = {
            maxMemoryMB = 7680,
            flake = {
              autoArchive = true,
              autoEvalInputs = true,
            },
          },
        },
      },
    }

    lsp.on_attach(function(client, _)
      require('lsp-format').on_attach(client)
      vim.keymap.set('n', '<space>ca', function()
        vim.lsp.buf.code_action { apply = true }
      end, bufopts)
    end)
    lsp.setup()

    local cmp = require 'cmp'
    local cmp_action = require('lsp-zero').cmp_action()

    cmp.setup {
      mapping = {
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

    vim.opt.signcolumn = 'yes' -- Disable lsp signals shifting buffer

    vim.diagnostic.config {
      virtual_text = true,
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
  end,
}
