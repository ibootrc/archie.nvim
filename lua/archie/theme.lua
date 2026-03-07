local M = {}

function M.get(config)
  local p = require 'archie.palette'
  local utils = require 'archie.utils'

  local theme = {}
  local groups = config.groups or {}
  local styles = {
    italic = (config.disable_italics and p.none) or 'italic',
    vert_split = (config.bold_vert_split and groups.border) or p.none,
    background = (config.disable_background and p.none) or p.bg,
    float_background = (config.disable_float_background and p.none) or p.bg,
  }

  theme = {
    -- CORE UI & CATEGORY 4: INACTIVE DIMMING
    Normal = { fg = p.fg, bg = styles.background },
    NormalNC = { fg = p.fg, bg = styles.background },
    NormalFloat = { fg = p.fg, bg = styles.float_background },
    CursorLine = { bg = p.bg_highlight },
    CursorLineNr = { fg = p.fg, style = 'bold' },
    LineNr = { fg = p.fg_dim },
    FloatBorder = { fg = p.fg, bg = p.none },
    FloatTitle = { fg = p.blue, style = 'bold' },
    ColorColumn = { bg = p.bg_highlight },
    SignColumn = { fg = p.fg, bg = p.none },
    VertSplit = { fg = p.border, bg = styles.vert_split },

    -- SELECTION & SEARCH
    Visual = { fg = p.fg, bg = p.bg_visual, style = 'bold' },
    Search = { fg = p.fg, bg = p.bg_visual, style = 'bold' },
    YankHighlight = { fg = p.fg, bg = p.blue, style = 'bold' },
    IncSearch = { fg = p.fg, bg = p.blue, style = 'bold' },
    CurSearch = { fg = p.fg, bg = p.blue, style = 'bold' },

    -- TELESCOPE & PLUGINS
    TelescopeNormal = { fg = p.fg, bg = p.none, style = 'bold' },
    TelescopeBorder = { fg = p.fg, bg = p.none },
    TelescopeSelection = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    TelescopeMatching = { fg = p.cyan, style = 'bold' },
    TelescopePromptPrefix = { fg = p.blue_deep, style = 'bold' },

    -- CATEGORY 2: DIAGNOSTICS
    DiagnosticError = { fg = p.red },
    DiagnosticWarn = { fg = p.yellow },
    DiagnosticInfo = { fg = p.blue },
    DiagnosticHint = { fg = p.teal },

    -- CATEGORY 1: SYNTAX SPECIFICS
    Comment = { fg = p.fg_dim, style = styles.italic },
    Constant = { fg = p.orange },
    String = { fg = p.cyan },
    Character = { fg = p.pink },
    Number = { fg = p.orange },
    Boolean = { fg = p.orange },
    Identifier = { fg = p.white },
    Function = { fg = p.blue_glow, style = 'bold' },
    Statement = { fg = p.purple },
    Keyword = { fg = p.pink },
    Type = { fg = p.teal },

    -- Treesitter Specifics
    ['@variable'] = { fg = p.fg },
    ['@variable.builtin'] = { fg = p.blue_glow },
    ['@parameter'] = { fg = p.fg_alt, style = styles.italic },
    ['@property'] = { fg = p.blue_glow },
    ['@field'] = { fg = p.blue_glow },
    ['@constructor'] = { fg = p.teal, style = 'bold' },
    ['@keyword.return'] = { fg = p.pink, style = 'bold' },

    -- COMPLETION, GITSIGNS, ETC.
    Pmenu = { fg = p.fg, bg = p.none },
    PmenuSel = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    BlinkCmpMenu = { fg = p.white, bg = p.none, style = 'bold' },
    BlinkCmpSel = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    GitSignsAdd = { fg = p.teal, style = 'bold' },
    GitSignsChange = { fg = p.yellow, style = 'bold' },
    GitSignsDelete = { fg = p.red, style = 'bold' },
    SagaBorder = { fg = p.fg, bg = p.none },

    -- Noice Highlights (Integrated into theme table)
    NoiceCmdlinePopup = { fg = p.fg, bg = p.none },
    NoiceCmdlinePopupBorder = { fg = p.fg, bg = p.none },
    NoicePopupBorder = { fg = p.fg, bg = p.none },
    NoiceConfirmBorder = { fg = p.fg, bg = p.none },
    NoiceLspDocBorder = { fg = p.fg, bg = p.none },
    NoiceVirtualText = { bg = p.bg_visual, fg = p.fg, style = 'bold' },
    NoiceFormatKind = { fg = p.fg_dim, bg = p.none },
    -- test
    NoiceFormatLevelWarn = { fg = p.yellow, bg = p.none },
    NoiceFormatLevelError = { fg = p.red, bg = p.none },
    NoiceFormatMessage = { fg = p.fg, bg = p.bg_visual, style = 'bold' },
    NoiceFormatLevelInfo = { fg = p.fg, bg = p.bg_visual, style = 'bold' },

    -- LAZY.NVIM: GLASS UI REWRITE
    LazyNormal = { fg = p.fg, bg = p.none }, -- Glass feel (Transparent)
    LazyBorder = { fg = p.border, bg = p.none },
    -- The "Top Bar" / Headers (Dark & Solid)
    LazyH1 = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    LazyH2 = { fg = p.fg, bg = p.none, style = 'bold' },
    -- Buttons & Navigation
    LazyButton = { fg = p.white, bg = p.bg_highlight, style = 'bold' },
    LazyButtonActive = { fg = p.fg, bg = p.bg_visual, style = 'bold' },
    -- Plugin Info & Status
    LazyDir = { fg = p.cyan, style = styles.italic },
    LazyUrl = { fg = p.blue_glow },
    LazyCommit = { fg = p.orange },
    LazyProp = { fg = p.teal },
    LazySpecial = { fg = p.pink },
    LazyReasonPlugin = { fg = p.pink },
    LazyReasonSource = { fg = p.fg_alt },
    LazyComment = { fg = p.fg_dim, bg = p.none, style = 'bold' },

    -- Progress Bars (Premium Look)
    LazyProgressDone = { fg = p.blue_glow, bg = p.none, style = 'bold' },
    LazyProgressTodo = { fg = p.bg_highlight, bg = p.none },

    -- MASON.NVIM: Matching Glass UI
    MasonNormal = { fg = p.fg, bg = p.none },
    MasonHeader = { fg = p.fg, bg = p.bg_visual, style = 'bold' },
    MasonHighlight = { fg = p.fg, bg = p.bg_visual },
    MasonHighlightBlock = { fg = p.fg, bg = p.bg_visual },
    MasonMuted = { fg = p.fg },
    MasonMutedBlock = { bg = p.bg_highlight, fg = p.fg },

    -- FIX: Virtual Text (The "Already up to date" Ghost Text)
    -- We use p.fg_alt for a soft, matte gray that looks like a watermark
    NonText = { fg = p.fg_alt, bg = p.none },
  }

  -- TERMINAL COLORS
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
