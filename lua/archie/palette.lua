local blend = require('archie.utils').blend
local bg_base = '#232629' -- Your Noice/Terminal background

local M = {
  -- Core UI (The Foundation)
  none = 'NONE',
  bg = 'NONE', -- Transparent as requested
  bg_dark = bg_base, -- For Noice/Statusline
  bg_panel = '#2a2e32', -- Slightly lighter for floating windows
  bg_visual = '#11405A', -- Your specific override
  blue_flash = '#0D3246',
  bg_highlight = '#34393e', -- For CursorLine (subtle)
  bg_float = '#5C5457',

  -- The Greys (Text & UI)
  fg = '#BEB199', -- Your main text (cursor_nr)
  fg_dim = '#87757C', -- Your grey1 (LineNr)
  fg_alt = '#5C5457', -- Your grey (Inactive text)
  fg_dark = '#34393e',
  border = '#454a4e', -- Subtle UI borders
  white = '#CCCCCC',

  -- The Blue Seed (#1D99F3) & its variants

  blue = '#0D3246', -- Primary Accent
  blue_glow = '#89DDFF', -- Brighter (for Booleans/Strings)
  blue_deep = '#1B668F', -- Muted (for Search/Functions)

  -- Secondary Accents (Harmonized)
  cyan = '#01D8DD', -- Your old "yellow"
  teal = '#3DAEE9', -- For Types
  orange = '#C5663F', -- From Lualine (Constants)
  pink = '#D17B9A', -- From Lualine (Keywords)
  purple = '#7060EB', -- From Lualine (Statements)
  red = '#D0679D', -- For Errors
  yellow = '#EBCB8B', -- Actual Yellow for Warnings
  green = '#A3BE8C', -- Actual Green for Git Add
}

return M
