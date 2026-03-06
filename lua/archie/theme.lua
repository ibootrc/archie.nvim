local blend = require('archie.utils').blend

local M = {}

function M.get(config)
  local p = require 'archie.palette'
  local utils = require 'archie.utils'

  -- PREMIUM BENDS & LAYERING
  -- 1. Create the 0.3 "Glass" Selection (Muted Blue blended with background)
  local visual_blend = utils.blend(p.blue_deep, '#000000', 0.3)

  -- 2. Define the "Elevated" background for Floats (Matches Lualine mid-section)
  local float_bg = p.bg_highlight

  local theme = {}
  local groups = config.groups or {}
  local styles = {
    italic = (config.disable_italics and p.none) or 'italic',
    vert_split = (config.bold_vert_split and groups.border) or p.none,
    background = (config.disable_background and p.none) or p.bg,
    float_background = float_bg, -- Now uses the unified elevated color
  }

  theme = {
    -- CORE UI (Transparency & Greys)
    Normal = { fg = p.fg, bg = styles.background },
    NormalFloat = { fg = p.fg, bg = styles.float_background },
    NormalNC = { fg = p.fg, bg = styles.background },
    CursorLine = { bg = p.bg_highlight },
    CursorLineNr = { fg = p.fg, style = 'bold' },
    LineNr = { fg = p.fg_dim },
    FloatBorder = { fg = p.blue_deep, bg = styles.float_background },
    FloatTitle = { fg = p.white, bg = styles.float_background, style = 'bold' },
    ColorColumn = { bg = p.bg_highlight },
    SignColumn = { fg = p.fg, bg = p.none },
    VertSplit = { fg = p.border, bg = styles.vert_split },
    Whitespace = { fg = p.fg_alt },
    NonText = { fg = p.fg_alt },

    -- SELECTION & SEARCH (The Glass & Flash Logic)
    -- Visual mode uses the subtle 0.3 blend
    Visual = { fg = p.white, bg = visual_blend, style = 'bold' },
    Search = { fg = p.white, bg = visual_blend },
    -- Yank & Active Match uses the vibrant Primary Blue (#1D99F3)
    YankHighlight = { fg = p.white, bg = p.blue, style = 'bold' },
    IncSearch = { fg = p.white, bg = p.blue, style = 'bold' },
    CurSearch = { link = 'IncSearch' },
    Substitute = { link = 'IncSearch' },

    -- POPUP MENU & COMPLETION (Unified with Floats/Lualine)
    Pmenu = { fg = p.fg, bg = styles.float_background },
    PmenuSel = { fg = p.white, bg = p.blue_deep, style = 'bold' },
    BlinkCmpMenu = { fg = p.fg, bg = styles.float_background },
    BlinkCmpMenuBorder = { fg = p.blue_deep, bg = styles.float_background },
    BlinkCmpDoc = { fg = p.fg, bg = styles.float_background },
    BlinkCmpDocBorder = { fg = p.blue_deep, bg = styles.float_background },
    BlinkCmpSel = { fg = p.white, bg = p.blue_deep, style = 'bold' },

    -- MANAGEMENT UI (Lazy, Mason, etc. - High Contrast)
    LazyNormal = { fg = p.fg, bg = styles.float_background },
    LazyButton = { fg = p.white, bg = p.blue_deep },
    LazySelection = { fg = p.white, bg = p.blue_deep, style = 'bold' },
    MasonNormal = { fg = p.fg, bg = styles.float_background },
    MasonHeader = { fg = p.white, bg = p.blue_deep, style = 'bold' },
    MasonHighlight = { fg = p.blue_glow },

    -- TELESCOPE (Unified with the "Elevated" look)
    TelescopeNormal = { fg = p.fg, bg = styles.float_background },
    TelescopeBorder = { fg = p.blue_deep, bg = styles.float_background },
    TelescopePromptNormal = { fg = p.white, bg = styles.float_background },
    TelescopePromptBorder = { fg = p.blue_deep, bg = styles.float_background },
    TelescopeSelection = { fg = p.white, bg = p.blue_deep, style = 'bold' },
    TelescopeMatching = { fg = p.cyan, style = 'bold' },
    TelescopePromptPrefix = { fg = p.blue },

    -- SYNTAX HIGHLIGHTING
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

    -- PLUGINS
    GitSignsAdd = { fg = p.teal },
    GitSignsChange = { fg = p.yellow },
    GitSignsDelete = { fg = p.red },
    NoiceVirtualText = { bg = p.bg_dark, fg = p.blue },
    SagaBorder = { fg = p.blue_deep, bg = styles.float_background },
    SagaNormal = { bg = styles.float_background },
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
