local blend = require('archie.utils').blend
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
    -- CORE UI (The Foundation)
    Normal = { fg = p.fg, bg = styles.background },
    NormalFloat = { fg = p.fg, bg = styles.float_background },
    NormalNC = { fg = p.fg, bg = styles.background },
    CursorLine = { bg = p.bg_highlight },
    CursorLineNr = { fg = p.fg, style = 'bold' },
    LineNr = { fg = p.fg_dim },
    FloatBorder = { fg = p.blue_deep, bg = p.none }, -- Deep blue for a premium frame
    FloatTitle = { fg = p.blue, style = 'bold' },
    ColorColumn = { bg = p.bg_highlight },
    SignColumn = { fg = p.fg, bg = p.none },
    VertSplit = { fg = p.border, bg = styles.vert_split },

    -- SELECTION & SEARCH
    Visual = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    Search = { fg = p.white, bg = p.bg_visual },
    YankHighlight = { fg = p.white, bg = p.blue, style = 'bold' },
    IncSearch = { fg = p.white, bg = p.blue, style = 'bold' },

    -- TELESCOPE (The Comprehensive Patch)
    TelescopeNormal = { fg = p.fg, bg = p.none },
    TelescopeBorder = { fg = p.fg_dim, bg = p.none },
    TelescopePromptNormal = { fg = p.white, bg = p.none },
    TelescopePromptBorder = { fg = p.blue, bg = p.none }, -- Restored blue focus
    TelescopeSelection = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    TelescopeMatching = { fg = p.cyan, style = 'bold' },
    TelescopePromptPrefix = { fg = p.blue, style = 'bold' },

    -- METADATA GROUPS (Restores the Detail Colors)
    TelescopeResultsDirectory = { fg = p.blue, style = 'bold' },
    TelescopeResultsIdentifier = { fg = p.purple }, -- Permissions
    TelescopeResultsNumber = { fg = p.orange }, -- File Size
    TelescopeResultsComment = { fg = p.fg_dim }, -- Dates

    -- EXTENSION LINKS (Ensures extensions like file-browser use these colors)
    FileBrowserDirectory = { link = 'TelescopeResultsDirectory' },
    FileBrowserPermission = { link = 'TelescopeResultsIdentifier' },
    FileBrowserSize = { link = 'TelescopeResultsNumber' },
    FileBrowserDate = { link = 'TelescopeResultsComment' },

    -- COMPLETION (Unified)
    Pmenu = { fg = p.fg, bg = p.none },
    PmenuSel = { fg = p.white, bg = p.bg_visual, style = 'bold' },
    BlinkCmpMenu = { fg = p.fg, bg = p.none },
    BlinkCmpMenuBorder = { fg = p.blue, bg = p.none },
    BlinkCmpSel = { fg = p.white, bg = p.bg_visual, style = 'bold' },

    -- SYNTAX (Consistent Accent Use)
    Comment = { fg = p.fg_dim, style = styles.italic },
    Constant = { fg = p.orange },
    String = { fg = p.cyan },
    Function = { fg = p.blue_glow },
    Keyword = { fg = p.pink },
    Statement = { fg = p.purple },
    Type = { fg = p.teal },
    ['@variable'] = { fg = p.fg },

    -- PLUGINS
    GitSignsAdd = { fg = p.green or p.teal },
    GitSignsChange = { fg = p.yellow },
    GitSignsDelete = { fg = p.red },
    NoiceVirtualText = { bg = p.bg_dark, fg = p.blue },
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
