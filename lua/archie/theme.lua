local blend = require('archie.utils').blend

local M = {}

function M.get(config)
  local p = require 'archie.palette'

  local theme = {}
  local groups = config.groups or {}
  local styles = {
    italic = (config.disable_italics and p.none) or 'italic',
    vert_split = (config.bold_vert_split and groups.border) or p.none,
    background = (config.disable_background and p.none) or p.bg,
    float_background = (config.disable_float_background and p.none) or p.bg,
  }

  theme = {
    -- Core UI (Refined with Overrides)
    ColorColumn = { bg = p.bg_highlight },
    Conceal = { bg = p.none },
    CurSearch = { bg = p.blue_deep, fg = p.none },
    Cursor = { fg = p.bg_dark, bg = p.blue_glow },
    CursorColumn = { bg = p.bg_highlight },
    CursorLine = { bg = p.grey },
    CursorLineNr = { fg = p.fg, style = 'bold' },
    DarkenedPanel = { bg = p.bg_dark },
    DarkenedStatusline = { bg = p.bg_dark },
    DiffAdd = { bg = blend(p.teal, p.bg_dark, 0.2) },
    DiffChange = { bg = p.bg_highlight },
    DiffDelete = { bg = blend(p.red, p.bg_dark, 0.2) },
    DiffText = { bg = blend(p.blue, p.bg_dark, 0.2) },
    diffAdded = { link = 'DiffAdd' },
    diffChanged = { link = 'DiffChange' },
    diffRemoved = { link = 'DiffDelete' },
    Directory = { fg = p.blue, bg = p.none },
    ErrorMsg = { fg = p.red, style = 'bold' },
    FloatBorder = { fg = p.fg_dim, bg = p.none },
    FloatTitle = { fg = p.blue, style = 'bold' },
    FoldColumn = { fg = p.fg_dim },
    Folded = { fg = p.fg, bg = p.bg_dark },
    IncSearch = { bg = p.blue_deep, fg = p.none },
    LineNr = { fg = p.fg_dim },
    MatchParen = { fg = p.white, bg = p.fg_dim },
    ModeMsg = { fg = p.blue },
    MoreMsg = { fg = p.blue },
    NonText = { fg = p.fg_alt },
    Normal = { fg = p.fg, bg = styles.background },
    NormalFloat = { fg = p.blue, bg = styles.float_background },
    NormalNC = { fg = p.fg, bg = styles.background },
    NvimInternalError = { fg = p.white, bg = p.red },
    Pmenu = { fg = p.white, bg = p.none },
    PmenuSbar = { bg = p.none },
    PmenuSel = { fg = p.white, bg = p.blue_deep, style = 'bold' },
    PmenuThumb = { bg = p.none },
    Question = { fg = p.yellow },
    Search = { bg = p.blue_deep, fg = p.none },
    SpecialKey = { fg = p.cyan },
    SpellBad = { sp = p.red, style = 'undercurl' },
    SpellCap = { sp = p.blue, style = 'undercurl' },
    SpellLocal = { sp = p.yellow, style = 'undercurl' },
    SpellRare = { sp = p.blue, style = 'undercurl' },
    SignColumn = { fg = p.fg, bg = p.none },
    StatusLine = { fg = p.blue, bg = p.bg_dark },
    StatusLineNC = { fg = p.fg_dim, bg = p.bg_dark },
    TabLine = { fg = p.fg_dim, bg = p.bg_dark },
    TabLineFill = { bg = p.bg_dark },
    TabLineSel = { fg = p.fg, bg = p.bg_highlight },
    Title = { fg = p.fg, style = 'bold' },
    VertSplit = { fg = p.border, bg = styles.vert_split },
    Visual = { bg = p.bg_visual },
    WarningMsg = { fg = p.yellow },
    Whitespace = { fg = p.fg_alt },
    WildMenu = { link = 'IncSearch' },

    -- Syntax (Harmonized)
    Constant = { fg = p.orange },
    String = { fg = p.cyan },
    Character = { fg = p.pink },
    Number = { fg = p.orange },
    Boolean = { fg = p.orange },
    Float = { fg = p.orange },
    Identifier = { fg = p.fg },
    Function = { fg = p.blue_glow },
    Statement = { fg = p.purple },
    Conditional = { fg = p.purple },
    Repeat = { fg = p.purple },
    Label = { fg = p.blue },
    Operator = { fg = p.blue_glow },
    Keyword = { fg = p.pink },
    Exception = { fg = p.red },
    PreProc = { fg = p.purple },
    Include = { fg = p.blue },
    Type = { fg = p.teal },
    Special = { fg = p.blue_glow },
    Delimiter = { fg = p.fg_dim },
    Comment = { fg = p.fg_dim, style = styles.italic },
    Underlined = { style = 'underline' },
    Bold = { style = 'bold' },
    Italic = { style = 'italic' },
    Error = { fg = p.red },
    Todo = { bg = p.yellow, fg = p.bg_dark, style = 'bold' },

    -- Treesitter (Modernized)
    ['@variable'] = { fg = p.fg },
    ['@variable.builtin'] = { fg = p.blue_glow },
    ['@constant.builtin'] = { fg = p.orange },
    ['@constructor'] = { fg = p.teal },
    ['@function'] = { link = 'Function' },
    ['@function.builtin'] = { fg = p.blue_glow },
    ['@function.call'] = { fg = p.blue },
    ['@keyword'] = { link = 'Keyword' },
    ['@keyword.function'] = { fg = p.pink },
    ['@keyword.operator'] = { fg = p.purple },
    ['@keyword.return'] = { fg = p.pink },
    ['@method'] = { fg = p.blue_glow },
    ['@property'] = { fg = p.blue_glow },
    ['@parameter'] = { fg = p.fg },
    ['@punctuation.bracket'] = { fg = p.fg },
    ['@punctuation.delimiter'] = { fg = p.blue },
    ['@string'] = { link = 'String' },
    ['@tag'] = { fg = p.teal },
    ['@tag.attribute'] = { fg = p.purple, style = styles.italic },
    ['@type'] = { link = 'Type' },

    -- Plugins: Blink.cmp & Cmp
    BlinkCmpMenu = { fg = p.white, bg = p.none },
    BlinkCmpMenuBorder = { fg = p.blue, bg = p.none },
    BlinkCmpDoc = { fg = p.white, bg = p.none },
    BlinkCmpDocBorder = { fg = p.blue, bg = p.none },
    BlinkCmpSel = { fg = p.blue, bg = p.bg_visual, style = 'bold' },
    CmpItemAbbrMatch = { fg = p.blue, style = 'bold' },
    CmpItemKind = { fg = p.pink },

    -- Plugins: Telescope
    TelescopeNormal = { link = 'NormalFloat' },
    TelescopeBorder = { fg = p.blue_deep },
    TelescopeSelection = { bg = p.bg_visual, fg = p.blue },
    TelescopeMatching = { fg = p.cyan, style = 'bold' },

    -- Plugins: Gitsigns
    GitSignsAdd = { fg = p.teal },
    GitSignsChange = { fg = p.yellow },
    GitSignsDelete = { fg = p.red },

    -- Plugins: NvimTree
    NvimTreeFolderName = { fg = p.blue },
    NvimTreeOpenedFolderName = { fg = p.blue_glow, style = 'bold' },
    NvimTreeRootFolder = { fg = p.purple, style = 'bold' },
    NvimTreeGitDirty = { fg = p.yellow },
    NvimTreeGitNew = { fg = p.teal },
    NvimTreeGitDeleted = { fg = p.red },

    -- Plugins: LspSaga
    SagaBorder = { fg = p.blue_deep, bg = p.none },
    SagaNormal = { bg = p.none },
    CodeActionText = { fg = p.yellow },

    -- Plugins: Noice
    NoiceVirtualText = { bg = p.bg_dark, fg = p.blue },
  }

  -- Terminal
  vim.g.terminal_color_0 = p.bg_dark
  vim.g.terminal_color_1 = p.red
  vim.g.terminal_color_2 = p.teal
  vim.g.terminal_color_3 = p.yellow
  vim.g.terminal_color_4 = p.blue
  vim.g.terminal_color_5 = p.purple
  vim.g.terminal_color_6 = p.cyan
  vim.g.terminal_color_7 = p.white

  return theme
end

return M
