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
    -- CORE UI (Transparency & Greys)
    Normal = { fg = p.fg, bg = styles.background },
    NormalFloat = { fg = p.blue, bg = styles.float_background },
    NormalNC = { fg = p.fg, bg = styles.background },
    CursorLine = { bg = p.bg_highlight },
    CursorLineNr = { fg = p.fg, style = 'bold' },
    LineNr = { fg = p.fg_dim },
    FloatBorder = { fg = p.fg_dim, bg = p.none },
    FloatTitle = { fg = p.blue, style = 'bold' },
    ColorColumn = { bg = p.bg_highlight },
    SignColumn = { fg = p.fg, bg = p.none },
    VertSplit = { fg = p.border, bg = styles.vert_split },
    Whitespace = { fg = p.fg_alt },
    NonText = { fg = p.fg_alt },

    -- SELECTION & SEARCH (The Blue Swap Logic)
    -- Visual mode uses the muted Blue_Deep (#1B668F)
    Visual = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    -- Search uses the same muted tone for consistency
    Search = { fg = p.white, bg = p.bg_visual },
    -- Yank/IncSearch uses the vibrant Flash Blue (#1D99F3)
    YankHighlight = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    IncSearch = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    CurSearch = { link = 'IncSearch' },
    Substitute = { link = 'IncSearch' },

    -- POPUP MENU & COMPLETION (Blink.cmp/Pmenu)
    Pmenu = { fg = p.fg, bg = p.none },
    PmenuSel = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    BlinkCmpMenu = { fg = p.fg, bg = p.none },
    BlinkCmpMenuBorder = { fg = p.blue, bg = p.none },
    BlinkCmpDoc = { fg = p.fg, bg = p.none },
    BlinkCmpDocBorder = { fg = p.blue, bg = p.none },
    BlinkCmpSel = { fg = p.white, bg = p.blue_deep, style = 'bold' },

    -- MANAGEMENT UI (Lazy, Mason, etc.)
    LazyNormal = { fg = p.fg, bg = p.none },
    LazyButton = { fg = p.white, bg = p.bg_highlight },
    LazySelection = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    MasonNormal = { fg = p.fg, bg = p.none },
    MasonHeader = { fg = p.white, bg = p.bg_highlight, style = 'bold' },
    MasonHighlight = { fg = p.blue_glow },
    MasonHighlightBlock = { fg = p.white, bg = p.bg_visual },

    -- TELESCOPE
    TelescopeNormal = { fg = p.fg, bg = p.none },
    TelescopeBorder = { fg = p.fg_dim, bg = p.none }, -- Muted border for better focus
    TelescopePromptNormal = { fg = p.white, bg = p.none },
    TelescopePromptBorder = { fg = p.blue_deep, bg = p.none }, -- Blue border when typing
    TelescopeSelection = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    TelescopeMatching = { fg = p.cyan, style = 'bold' }, -- High visibility matches
    TelescopePromptPrefix = { fg = p.blue, style = 'bold' },

    -- TELESCOPE FILE DETAILS (The Fix)
    TelescopeResultsDirectory = { fg = p.blue_deep, style = 'bold' }, -- Directories: Blue
    TelescopeResultsIdentifier = { fg = p.purple }, -- Permissions: Purple
    TelescopeResultsNumber = { fg = p.orange }, -- Sizes: Orange
    TelescopeResultsComment = { fg = p.fg_dim }, -- Dates: Faint Grey
    TelescopeResultsVariable = { fg = p.white }, -- Main Filename

    -- SYNTAX HIGHLIGHTING (Modern Treesitter)
    Comment = { fg = p.fg_dim, style = styles.italic },
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
    Type = { fg = p.teal },
    Special = { fg = p.blue_glow },
    Delimiter = { fg = p.fg_dim },
    ['@variable'] = { fg = p.fg },
    ['@function'] = { link = 'Function' },
    ['@keyword'] = { link = 'Keyword' },
    ['@property'] = { fg = p.blue_glow },
    ['@parameter'] = { fg = p.fg },

    -- PLUGINS: Gitsigns, Noice, Saga
    GitSignsAdd = { fg = p.green or p.teal },
    GitSignsChange = { fg = p.yellow },
    GitSignsDelete = { fg = p.red },
    NoiceVirtualText = { bg = p.bg_visual, fg = p.white },
    SagaBorder = { fg = p.blue_deep, bg = p.none },
    SagaNormal = { bg = p.none },
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
