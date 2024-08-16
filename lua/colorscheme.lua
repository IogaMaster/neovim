deps.add { source = 'RRethy/base16-nvim' }

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
    -- nvim-cmp
    CmpItemKindSnippet = { fg = colors.base01, bg = colors.base0E },
    CmpItemKindKeyword = { fg = colors.base01, bg = colors.base08 },
    CmpItemKindText = { fg = colors.base01, bg = colors.base0C },
    CmpItemKindMethod = { fg = colors.base01, bg = colors.base0D },
    CmpItemKindConstructor = { fg = colors.base01, bg = colors.base0D },
    CmpItemKindFunction = { fg = colors.base01, bg = colors.base0D },
    CmpItemKindFolder = { fg = colors.base01, bg = colors.base0D },
    CmpItemKindModule = { fg = colors.base01, bg = colors.base0D },
    CmpItemKindConstant = { fg = colors.base01, bg = colors.base0A },
    CmpItemKindField = { fg = colors.base01, bg = colors.base0B },
    CmpItemKindProperty = { fg = colors.base01, bg = colors.base0B },
    CmpItemKindEnum = { fg = colors.base01, bg = colors.base0B },
    CmpItemKindUnit = { fg = colors.base01, bg = colors.base0B },
    CmpItemKindClass = { fg = colors.base01, bg = colors.base09 },
    CmpItemKindVariable = { fg = colors.base01, bg = colors.base0F },
    CmpItemKindFile = { fg = colors.base01, bg = colors.base0D },
    CmpItemKindInterface = { fg = colors.base01, bg = colors.base09 },
    CmpItemKindColor = { fg = colors.base01, bg = colors.base08 },
    CmpItemKindReference = { fg = colors.base01, bg = colors.base08 },
    CmpItemKindEnumMember = { fg = colors.base01, bg = colors.base08 },
    CmpItemKindStruct = { fg = colors.base01, bg = colors.base0D },
    CmpItemKindValue = { fg = colors.base01, bg = colors.base0A },
    CmpItemKindEvent = { fg = colors.base01, bg = colors.base0D },
    CmpItemKindOperator = { fg = colors.base01, bg = colors.base0D },
    CmpItemKindTypeParameter = { fg = colors.base01, bg = colors.base0D },
    CmpItemKindCopilot = { fg = colors.base01, bg = colors.base0C },

    -- Telescope
    TelescopeMatching = { fg = colors.base0E },
    TelescopeSelection = { fg = colors.base05, bg = colors.base01, bold = true },
    TelescopePromptPrefix = { fg = colors.base08 },
    TelescopePromptNormal = { bg = colors.base01 },
    TelescopeResultsNormal = { bg = colors.base00 },
    TelescopePreviewNormal = { bg = colors.base00 },
    TelescopePromptBorder = { bg = colors.base01, fg = colors.base01 },
    TelescopeResultsBorder = { bg = colors.base00, fg = colors.base00 },
    TelescopePreviewBorder = { bg = colors.base00, fg = colors.base00 },
    TelescopePromptTitle = { bg = colors.base08, fg = colors.base00 },
    TelescopeResultsTitle = { fg = colors.base00 },
    TelescopePreviewTitle = { bg = colors.base0B, fg = colors.base00 },
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
