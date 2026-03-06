local utils = {}

local function rgb(color)
  -- 1. Handle transparency/nil immediately
  if color == 'NONE' or color == 'none' or not color then
    color = '#1e1e2e' -- Fallback for blending math
  end

  -- 2. Force conversion to hex string if it's a palette name
  -- (e.g., if 'blue' was passed instead of '#1D99F3')
  if type(color) == 'string' and not color:find '#' then
    local palette = require 'archie.palette'
    color = palette[color] or '#1e1e2e'
  end

  -- 3. Convert Hex String to Number for bitwise operations
  local hex = color:gsub('#', '')
  local n = tonumber(hex, 16) or 0

  return {
    bit.band(bit.rshift(n, 16), 0xFF),
    bit.band(bit.rshift(n, 8), 0xFF),
    bit.band(n, 0xFF),
  }
end

local function parse_color(color)
  if not color or color == 'NONE' or color == 'none' then
    return 'NONE'
  end

  -- If it's a key in the palette, return the hex value
  local palette = require 'archie.palette'
  if palette[color] then
    return palette[color]
  end

  -- Otherwise return as is (assuming it's already a hex)
  return color
end

-- blend remains the same as your math is correct
utils.blend = function(fg, bg, alpha)
  local fg_rgb = rgb(fg) -- Pass raw string/key
  local bg_rgb = rgb(bg)

  local function blend_channel(i)
    local ret = (alpha * fg_rgb[i] + ((1 - alpha) * bg_rgb[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format('#%02X%02X%02X', blend_channel(1), blend_channel(2), blend_channel(3))
end

utils.highlight = function(group, color)
  -- Ensure we use the parsed hex or 'NONE'
  local guistyle = color.style and 'gui=' .. color.style or 'gui=NONE'
  local guifg = color.fg and 'guifg=' .. parse_color(color.fg) or 'guifg=NONE'
  local guibg = color.bg and 'guibg=' .. parse_color(color.bg) or 'guibg=NONE'
  local guisp = color.sp and 'guisp=' .. parse_color(color.sp) or 'guisp=NONE'

  -- Using nvim_set_hl is more modern and reliable than vim.cmd('highlight...')
  -- But to stay consistent with your architecture, we'll keep the cmd for now:
  vim.cmd(string.format('highlight %s %s %s %s %s', group, guistyle, guifg, guibg, guisp))

  if color.link then
    vim.cmd(string.format('highlight! link %s %s', group, color.link))
  end
end

return utils
