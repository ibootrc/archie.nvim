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
    -- NormalNC (Non-Current) dims the text of inactive windows
    NormalNC = { fg = p.fg_alt, bg = styles.background },
    NormalFloat = { fg = p.fg, bg = styles.float_background },
    CursorLine = { bg = p.bg_highlight },
    CursorLineNr = { fg = p.fg, style = 'bold' },
    LineNr = { fg = p.fg_dim },
    FloatBorder = { fg = p.blue_deep, bg = p.none },
    FloatTitle = { fg = p.blue, style = 'bold' },
    ColorColumn = { bg = p.bg_highlight },
    SignColumn = { fg = p.fg, bg = p.none },
    VertSplit = { fg = p.border, bg = styles.vert_split },

    -- SELECTION & SEARCH
    Visual = { fg = p.white, bg = p.blue_glow, style = 'bold' },
    Search = { fg = p.white, bg = p.bg_visual },
    YankHighlight = { fg = p.white, bg = p.blue, style = 'bold' },
    IncSearch = { fg = p.white, bg = p.blue, style = 'bold' },
    -- THE FIX FOR THE YELLOW HIGHLIGHT:
    Substitute = { link = 'IncSearch' }, -- Forces first match to Blue
    CurSearch = { link = 'IncSearch' }, -- Modern Neovim 'Current Search'

    -- TELESCOPE & PLUGINS
    TelescopeNormal = { fg = p.fg, bg = p.none },
    TelescopeBorder = { fg = p.fg, bg = p.none },
    TelescopeSelection = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    TelescopeMatching = { fg = p.cyan, style = 'bold' },
    TelescopePromptPrefix = { fg = p.blue_deep, style = 'bold' },

    -- CATEGORY 2: DIAGNOSTICS (Underlines & Signs)
    DiagnosticError = { fg = p.red },
    DiagnosticWarn = { fg = p.yellow },
    DiagnosticInfo = { fg = p.blue },
    DiagnosticHint = { fg = p.teal },
    -- Underlines use 'undercurl' for a modern, high-end feel
    DiagnosticUnderlineError = { sp = p.red, style = 'undercurl' },
    DiagnosticUnderlineWarn = { sp = p.yellow, style = 'undercurl' },
    DiagnosticUnderlineInfo = { sp = p.blue, style = 'undercurl' },
    DiagnosticUnderlineHint = { sp = p.teal, style = 'undercurl' },

    -- CATEGORY 1: SYNTAX SPECIFICS (Better Contrast)
    Comment = { fg = p.fg_dim, style = styles.italic },
    Constant = { fg = p.orange },
    String = { fg = p.cyan },
    Character = { fg = p.pink },
    Number = { fg = p.orange },
    Boolean = { fg = p.orange },
    Identifier = { fg = p.white }, -- Variable declarations pop more
    Function = { fg = p.blue_glow, style = 'bold' },
    Statement = { fg = p.purple },
    Keyword = { fg = p.pink },
    Type = { fg = p.teal },

    -- Treesitter Specifics
    ['@variable'] = { fg = p.fg }, -- Standard variables
    ['@variable.builtin'] = { fg = p.blue_glow }, -- 'self', 'this', etc.
    ['@parameter'] = { fg = p.fg_alt, style = styles.italic }, -- Parameters are distinct
    ['@property'] = { fg = p.blue_glow }, -- Object properties
    ['@field'] = { fg = p.blue_glow },
    ['@constructor'] = { fg = p.teal, style = 'bold' },
    ['@keyword.return'] = { fg = p.pink, style = 'bold' },

    -- COMPLETION, GITSIGNS, ETC.
    Pmenu = { fg = p.fg, bg = p.none },
    PmenuSel = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    BlinkCmpMenu = { fg = p.fg, bg = p.none },
    BlinkCmpSel = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    GitSignsAdd = { fg = p.teal },
    GitSignsChange = { fg = p.yellow },
    GitSignsDelete = { fg = p.red },
    NoiceVirtualText = { bg = p.bg_visual, fg = p.white },
    SagaBorder = { fg = p.blue_deep, bg = p.none },
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
