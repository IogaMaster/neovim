local all_pkgs = {}
local plugin_pkgs = {}

vim.g.lz_n = {
  load = function(name)
    for _, p in ipairs(plugin_pkgs[name] or {}) do
      vim.cmd.packadd(p.src:match '[^/]+$')
    end
    vim.cmd.packadd(name)
  end,
}

require('lz.n').register_handler {
  spec_field = 'pkgs',
  parse = function(plugin, pkgs)
    local resolved = vim.tbl_map(function(p)
      if type(p) == 'string' then
        return { src = p:find '://' and p or 'https://github.com/' .. p }
      end
      return p
    end, pkgs or {})
    plugin_pkgs[plugin.name] = resolved
    vim.list_extend(all_pkgs, resolved)
  end,
  add = function(_) end,
  del = function(_) end,
  lookup = function(_)
    return nil
  end,
}

vim.api.nvim_create_autocmd('VimEnter', { once = true, callback = function()
  local seen = {}
  vim.pack.add(vim.tbl_filter(function(p)
    if seen[p.src] then return false end
    seen[p.src] = true
    return true
  end, all_pkgs), { confirm = false, load = false })
end })
