return {
  'nvim-lspconfig', -- forced config call
  pkgs = {
    'neovim/nvim-lspconfig',
    'Massolari/lsp-auto-setup.nvim',

    -- Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',

    -- Juice
    'onsails/lspkind-nvim',
    'Bekaboo/dropbar.nvim',
    'code-biscuits/nvim-biscuits',
  },
  lazy = false,
  keys = {
    { 'gd', vim.lsp.buf.definition },
    { 'gr', vim.lsp.buf.references },
    { 'K', vim.lsp.buf.hover },
    { '<leader>cr', vim.lsp.buf.rename },
    { '<leader>ca', vim.lsp.buf.code_action },
    { '<leader>cf', vim.lsp.buf.format },
    { '<C-space>', vim.lsp.completion.get, mode = 'i' },
  },
  after = function()
    -- ========= LSP CONFIG =========
    -- Sign icons
    vim.diagnostic.config {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '✘',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.HINT] = '',
          [vim.diagnostic.severity.INFO] = '',
        },
      },
    }

    -- Format on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      callback = function(args)
        vim.lsp.buf.format {
          bufnr = args.buf,
          filter = function(client)
            return client.supports_method 'textDocument/formatting'
          end,
        }
      end,
    })

    -- Path completion
    vim.keymap.set('i', '/', function()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local before = vim.api.nvim_get_current_line():sub(1, col)
      if before:match '[%./~%w]$' then
        return '/<C-x><C-f>'
      end
      return '/'
    end, { expr = true })

    require('lsp-auto-setup').setup()

    -- ========= SNIPPETS =========
    require('luasnip.loaders.from_vscode').lazy_load()

    -- ========= COMPLETION =========
    vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'popup', 'fuzzy' }
    vim.opt.completeitemalign = 'kind,abbr,menu'
    vim.opt.complete = '.,f,snp'
    vim.opt.pumheight = 20
    vim.opt.pumblend = 0

    -- ========= KEYS =========
    -- Tab forward and back, or jump through snippets
    vim.keymap.set({ 'i', 's' }, '<Tab>', function()
      if require('luasnip').jumpable(1) then
        return '<Plug>luasnip-jump-next'
      end
      return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
    end, { expr = true })
    vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
      if require('luasnip').jumpable(-1) then
        return '<Plug>luasnip-jump-prev'
      end
      return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>'
    end, { expr = true })

    vim.keymap.set('i', '<CR>', function() -- Enter should work normally unless a selection is made, also directories should open a new completion
      local info = vim.fn.complete_info { 'selected', 'items' }
      if vim.fn.pumvisible() == 1 and info.selected ~= -1 then
        local item = info.items[info.selected + 1]
        if item and item.word:sub(-1) == '/' then
          return '<C-y><C-x><C-f>' -- confirm dir then retrigger path completion
        end
        return '<C-y>'
      end
      return '<CR>'
    end, { expr = true })

    -- ========= LSP COMPLETION =========
    local function enable_completion(client, bufnr)
      if not client.supports_method 'textDocument/completion' then
        return
      end
      vim.lsp.completion.enable(true, client.id, bufnr, {
        autotrigger = true,
        convert = function(item)
          local kind_name = vim.lsp.protocol.CompletionItemKind[item.kind] or 'Unknown'
          local icon = require('lspkind').symbolic(kind_name, { mode = 'symbol' }) or ''
          return {
            word = item.label,
            abbr = ' ' .. item.label,
            kind = ' ' .. icon .. ' ',
            kind_hlgroup = 'LspKind' .. kind_name,
          }
        end,
      })
    end

    -- Auto-trigger completion after 3+ chars
    vim.api.nvim_create_autocmd('TextChangedI', {
      callback = function()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local before = vim.api.nvim_get_current_line():sub(1, col)
        if before:match '%w%w%w+$' then
          vim.lsp.completion.get()
        end
      end,
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
          enable_completion(client, args.buf)
        end
      end,
    })

    for _, client in ipairs(vim.lsp.get_clients()) do
      for bufnr in pairs(client.attached_buffers) do
        enable_completion(client, bufnr)
      end
    end

    -- ========= JUICE =========
    require('nvim-biscuits').setup {
      cursor_line_only = true,
      default_config = {
        min_distance = 5,
      },
    }
  end,
}
