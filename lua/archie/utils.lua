local utils = {}

-- Helper to extract RGB channels
local function byte(value, offset)
  return bit.band(bit.rshift(value, offset), 0xFF)
end

-- UPDATED: Handles 'NONE' by falling back to a default hex for math purposes
local function rgb(color)
  -- If the color is "NONE", use a neutral dark color for blending math
  if color == 'NONE' or color == 'none' or not color then
    color = '#1e1e2e'
  end

  -- Convert hex string to number if needed
  if type(color) == 'string' and color:sub(1, 1) == '#' then
    color = tonumber(color:sub(2), 16)
  end

  return {
    bit.band(bit.rshift(color, 16), 0xFF),
    bit.band(bit.rshift(color, 8), 0xFF),
    bit.band(color, 0xFF),
  }
end

local function parse_color(color)
  if not color then
    return 'NONE'
  end
  color = color:lower()

  -- If it's already a hex or 'none', return it
  if color:find '#' or color == 'none' then
    return color
  end

  -- Try to find it in the palette
  local palette = require 'archie.palette'
  if palette[color] then
    return palette[color]
  end

  return color
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number 0 to 1
utils.blend = function(fg, bg, alpha)
  local fg_rgb = rgb(parse_color(fg))
  local bg_rgb = rgb(parse_color(bg))

  local function blend_channel(i)
    local ret = (alpha * fg_rgb[i] + ((1 - alpha) * bg_rgb[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format('#%02X%02X%02X', blend_channel(1), blend_channel(2), blend_channel(3))
end

-- This stays the same, handles the vim.cmd calls
utils.highlight = function(group, color)
  local style = color.style and 'gui=' .. color.style or 'gui=NONE'
  local fg = color.fg and 'guifg=' .. parse_color(color.fg) or 'guifg=NONE'
  local bg = color.bg and 'guibg=' .. parse_color(color.bg) or 'guibg=NONE'
  local sp = color.sp and 'guisp=' .. parse_color(color.sp) or ''

  vim.cmd(string.format('highlight %s %s %s %s %s', group, style, fg, bg, sp))

  if color.link then
    vim.cmd(string.format('highlight! link %s %s', group, color.link))
  end
end

return utils
