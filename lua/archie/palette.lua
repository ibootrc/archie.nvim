--- palette variants
local variants = {
	main = { -- main palette
	yellow = '#01D8DD',
	teal1 = '#1d99f3',
	teal2 = '#1b668f',
	teal3 = '#3daee9',
	blue1 = '#89DDFF',
	blue2 = '#ADD7FF',
	blue3 = '#91B4D5',
	blue4 = '#7390AA',
	pink1 = '#FAE4FC',
	pink2 = '#FCC5E9',
	pink3 = '#D0679D',
	blueGray1 = '#A6ACCD',
	blueGray2 = '#767C9D',
	blueGray3 = '#506477',
	background1 = '#31363b',
	background2 = '#31363b',
	background3 = '#232629',
	text = '#E4F0FB',
	white = '#FFFFFF',
	none = 'NONE',
},
}

local palette = {}

palette = variants.main

-- if vim.o.background == "light" then
-- 	palette = variants.main
-- else
-- 	palette = variants[(vim.g.poimandres_variant == "storm" and "storm") or "main"]
-- end

return palette
