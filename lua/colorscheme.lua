vim.pack.add { { src = 'https://github.com/RRethy/base16-nvim' } }

local colorscheme_path = vim.fn.expand '~/.config/base16.lua'
local colors

local function apply_colorscheme()
  if vim.fn.filereadable(colorscheme_path) == 1 then
    -- Load the color scheme from the file
    colors = dofile(colorscheme_path)
  else
    -- Use the fallback color scheme
    colors = {
      base00 = '#16161D',
      base01 = '#2c313c',
      base02 = '#3e4451',
      base03 = '#6c7891',
      base04 = '#565c64',
      base05 = '#abb2bf',
      base06 = '#9a9bb3',
      base07 = '#c5c8e6',
      base08 = '#e06c75',
      base09 = '#d19a66',
      base0A = '#e5c07b',
      base0B = '#98c379',
      base0C = '#56b6c2',
      base0D = '#0184bc',
      base0E = '#c678dd',
      base0F = '#a06949',
    }
  end

  require('base16-colorscheme').setup(colors)

  local highlights = {
    -- completion
    Pmenu = { fg = colors.base05, bg = colors.base01 },
    PmenuSel = { fg = colors.base05, bg = colors.base02, bold = true },
    PmenuSbar = { bg = colors.base01 },
    PmenuThumb = { bg = colors.base03 },
    PmenuKind = { fg = colors.base03, bg = colors.base01 },
    PmenuKindSel = { fg = colors.base0D, bg = colors.base02 },
    PmenuExtra = { fg = colors.base03, bg = colors.base01 },
    PmenuExtraSel = { fg = colors.base03, bg = colors.base02 },
    -- lsp kind
    LspKindText = { fg = colors.base01, bg = colors.base0C },
    LspKindMethod = { fg = colors.base01, bg = colors.base0D },
    LspKindFunction = { fg = colors.base01, bg = colors.base0D },
    LspKindConstructor = { fg = colors.base01, bg = colors.base0D },
    LspKindField = { fg = colors.base01, bg = colors.base0B },
    LspKindVariable = { fg = colors.base01, bg = colors.base0F },
    LspKindClass = { fg = colors.base01, bg = colors.base09 },
    LspKindInterface = { fg = colors.base01, bg = colors.base09 },
    LspKindModule = { fg = colors.base01, bg = colors.base0D },
    LspKindProperty = { fg = colors.base01, bg = colors.base0B },
    LspKindUnit = { fg = colors.base01, bg = colors.base0B },
    LspKindValue = { fg = colors.base01, bg = colors.base0A },
    LspKindEnum = { fg = colors.base01, bg = colors.base0B },
    LspKindKeyword = { fg = colors.base01, bg = colors.base08 },
    LspKindSnippet = { fg = colors.base01, bg = colors.base0E },
    LspKindColor = { fg = colors.base01, bg = colors.base08 },
    LspKindFile = { fg = colors.base01, bg = colors.base0D },
    LspKindReference = { fg = colors.base01, bg = colors.base08 },
    LspKindFolder = { fg = colors.base01, bg = colors.base0D },
    LspKindEnumMember = { fg = colors.base01, bg = colors.base08 },
    LspKindConstant = { fg = colors.base01, bg = colors.base0A },
    LspKindStruct = { fg = colors.base01, bg = colors.base0D },
    LspKindEvent = { fg = colors.base01, bg = colors.base0D },
    LspKindOperator = { fg = colors.base01, bg = colors.base0D },
    LspKindTypeParameter = { fg = colors.base01, bg = colors.base0D },

    -- Telescope
    TelescopeMatching = { fg = colors.base0E, bg = colors.base01 },
    TelescopeSelection = { fg = colors.base05, bg = colors.base01, bold = true },
    TelescopePromptPrefix = { fg = colors.base08, bg = colors.base01 },
    TelescopePromptNormal = { bg = colors.base01 },
    TelescopeResultsNormal = { bg = colors.base01 },
    TelescopePreviewNormal = { bg = colors.base01 },
    TelescopePromptBorder = { bg = colors.base01, fg = colors.base01 },
    TelescopeResultsBorder = { bg = colors.base01, fg = colors.base01 },
    TelescopePreviewBorder = { bg = colors.base01, fg = colors.base01 },
    TelescopePromptTitle = { bg = colors.base08, fg = colors.base01 },
    TelescopeResultsTitle = { fg = colors.base01, bg = colors.base01 },
    TelescopePreviewTitle = { bg = colors.base0B, fg = colors.base01 },
    TelescopeNormal = { bg = colors.base01 },
    TelescopeBorder = { bg = colors.base01, fg = colors.base01 },
    TelescopeSelectionCaret = { fg = colors.base08, bg = colors.base01 },
    TelescopePromptCounter = { fg = colors.base05, bg = colors.base01 },

    -- lsp
    NormalFloat = { bg = colors.base01 },
  }

  -- Apply highlights
  for group, colors in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, colors)
  end
end

local function reload_colorscheme()
  local interval = 500 -- Interval in milliseconds (500ms = 0.5 seconds)

  local function loop()
    apply_colorscheme()
    vim.defer_fn(loop, interval)
  end

  loop() -- Start the loop
end

apply_colorscheme() -- apply the first time
reload_colorscheme()
