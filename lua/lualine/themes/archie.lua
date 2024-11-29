local palette = require 'archie.palette'

local archie = {}

archie.normal = {
	a = { fg = palette.background2, bg = palette.teal1, gui = 'bold' },
	b = { fg = palette.text, bg = palette.background1 },
	c = { fg = palette.blueGray1, bg = palette.none },
}

archie.insert = {
	a = { fg = palette.background2, bg = palette.blue1, gui = 'bold' },
	b = { fg = palette.text, bg = palette.background1 },
}

archie.visual = {
	a = { fg = palette.background2, bg = palette.yellow, gui = 'bold' },
	b = { fg = palette.text, bg = palette.background1 },
}

archie.replace = {
	a = { fg = palette.background2, bg = palette.pink3, gui = 'bold' },
	b = { fg = palette.text, bg = palette.background1 },
}

archie.command = {
	a = { fg = palette.background2, bg = palette.yellow, gui = 'bold' },
	b = { fg = palette.text, bg = palette.background1 },
}

archie.inactive = {
	a = { fg = palette.blueGray3, bg = palette.background1, gui = 'bold' },
	b = { fg = palette.blueGray3, bg = palette.background1 },
	c = { fg = palette.blueGray3, bg = palette.none },
}

return archie
