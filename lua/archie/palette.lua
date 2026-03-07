local blend = require('archie.utils').blend
local bg_base = '#232629' -- Your Noice/Terminal background

local M = {
  -- Core UI (The Foundation)
  none = 'NONE',
  bg = 'NONE', -- Transparent as requested
  bg_dark = bg_base, -- For Noice/Statusline
  bg_panel = '#2a2e32', -- Slightly lighter for floating windows
  bg_visual = '#11405A', -- Your specific override
  blue_flash = '#6B9CB5',
  bg_highlight = '#34393e', -- For CursorLine (subtle)

  -- The Greys (Text & UI)
  fg = '#BEB199', -- Your main text (cursor_nr)
  fg_dim = '#87757C', -- Your grey1 (LineNr)
  fg_alt = '#5C5457', -- Your grey (Inactive text)
  border = '#454a4e', -- Subtle UI borders
  white = '#CCCCCC',

  -- The Blue Seed (#1D99F3) & its variants
  blue = '#1D99F3', -- Primary Accent
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

--- Variantes de #1B668F (Faint / Estompé) ---

--[ REFERENCE ]    #0E3348  (Deepest / Dark Background)
--[ SUBTLE    ]    #0D3246  (Low-contrast / Block Selection)
--[ MID-TONE  ]    #154E6D  (Standard Active / Balanced)
--[ BASE      ]    #1B668F  (Your original color)
--[ STAND-OUT ]    #2488BE  (High-visibility / Search Highlight)
--[ DUSK BLUE   ]  #11405A  (A desaturated, soft version of your base)
--[ BASE MATTE  ]  #1B668F  (Your original color)
--[ STEEL LIGHT ]  #3C7A9B  (Muted foreground for secondary text)
--[ FROSTED     ]  #6B9CB5  (Very soft; looks like "faint" blue text)

--[ PURE WHITE  ]  #FFFFFF  (The "blinding" original)
--[ CLOUD       ]  #E6E6E6  (90% Brightness - The standard "comfortable" white)
--[ NICKEL      ]  #CCCCCC  (80% Brightness - Matte finish; looks professional)
--[ CONCRETE    ]  #B3B3B3  (70% Brightness - Great for non-essential info)
--[ CHARCOAL    ]  #4D4D4D  (30% Brightness - Deep UI borders)
