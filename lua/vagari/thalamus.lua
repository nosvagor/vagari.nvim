local p = require("vagari.palette")
local thalamus = {}

thalamus = {

	txt = {
		norm = { fg = p.fg, bg = p.bg },
		minor = { fg = p.slt_5 },
		bold = { fmt = "bold" },
		italic = { fg = p.blu_4, fmt = "italic" },
		underline = { fg = p.brt_0, sp = p.brt_2, fmt = "underline" },
		strike = { fg = p.slt_4, fmt = "strikethrough" },
		title = { fg = p.sky_2, fmt = "bold" },
		reverse = { fg = p.bg, bg = p.brt_1 },
		inactive = { fg = p.gry_1 },
	},

	passive = {
		comment = { fg = p.slt_2 },
		invis = { fg = p.bg },
		disown = { fg = p.blu_0, bg = p.drk_1 },
		norm = { fg = p.glc_4, bg = p.drk_0 },
		fg = { fg = p.glc_4 },
		bg = { bg = p.drk_0 },
	},

	idle = {
		norm = { fg = p.blu_2 },
		solid = { bg = p.blu_2 },
		bg = { bg = p.glc_2 },
		passive = { fg = p.blu_2, bg = p.drk_0 },
		passive_br = { fg = p.blu_2, bg = p.glc_0 },
		invis_br = { fg = p.glc_0, bg = p.glc_0 },
		bold = { fg = p.blu_2, fmt = "bold" },
		search = { fg = p.blu_0 },
		ref = { fg = p.blu_0, fmt = "bold" },
	},

	active = {
		norm = { fg = p.orn_4 },
		input = { fg = p.orn_4, bg = p.glc_0 },
		select = { fg = p.orn_4, bg = p.glc_2, fmt = "bold" },
		visual = { bg = p.glc_2, fmt = "bold" },
		search = { fg = p.orn_1, fmt = "bold" },
	},

	state = {
		add = { fg = p.tyr_1 },
		new = { fg = p.pro_1 },
		modified = { fg = p.glu_1 },
		delete = { fg = p.his_1 },
	},

	msg = {
		success = {
			norm = { fg = p.emr_3 },
			inverse = { fg = p.emr_2, fmt = "reverse" },
		},
		error = {
			builtin = { fg = p.rby_1 },
			norm = { fg = p.rby_3 },
			inverse = { fg = p.rby_2, fmt = "reverse" },
			under = { sp = p.rby_1, fmt = "undercurl" },
			virtual = { fg = p.rby_4 },
		},
		warn = {
			norm = { fg = p.sun_3 },
			alt = { fg = p.sun_2, fmt = "italic" },
			under = { sp = p.sun_1, fmt = "undercurl" },
			virtual = { fg = p.sun_4 },
		},
		hint = {
			norm = { fg = p.sky_3 },
			under = { sp = p.sky_1, fmt = "undercurl" },
			special = { fg = p.sky_1 },
			virtual = { fg = p.sky_4 },
		},
		info = {
			norm = { fg = p.cyn_3 },
			under = { sp = p.cyn_1, fmt = "undercurl" },
			custom = { sp = p.cyn_1, fmt = "undercurl" },
			rare = { sp = p.pnk_1, fmt = "undercurl" },
			virtual = { fg = p.cyn_4 },
		},
	},

	str = {
		special = { fg = p.grn_4 },
		norm = { fg = p.grn_3 },
		doc = { fg = p.grn_2 },
		regex = { fg = p.grn_1 },
		char = { fg = p.tyr_2 },
	},

	func = {
		def = { fg = p.orn_4, fmt = "bold" },
		norm = { fg = p.orn_4 },
		builtin = { fg = p.orn_2 },
		macro = { fg = p.orn_3, fmt = "italic" },
	},

	delim = {
		norm = { fg = p.glu_2 },
		bracket = { fg = p.glu_3 },
	},

	const = {
		norm = { fg = p.sun_3 },
		builtin = { fg = p.sun_0, fmt = "italic" },
		external = { fg = p.asn_3, fmt = "italic" },
	},

	var = {
		tag = { fg = p.blu_1 },
		builtin = { fg = p.blu_2 },
		norm = { fg = p.blu_3 },
		attr = { fg = p.blu_3, fmt = "italic" },
		param = { fg = p.blu_4 },
	},

	keyword = {
		external = { fg = p.asn_2, fmt = "italic" },
		externaldef = { fg = p.asn_2, fmt = "italic,bold" },
		logic = { fg = p.prp_1, fmt = "italic" },
		norm = { fg = p.prp_2, fmt = "italic" },
		label = { fg = p.prp_3 },
		def = { fg = p.prp_2, fmt = "bold,italic" },
		flow = { fg = p.prp_1, fmt = "bold,italic" },
		exception = { fg = p.rby_2, fmt = "bold,italic" },
	},

	type = {
		struct = { fg = p.prp_0, fmt = "italic" },
		store = { fg = p.sky_3, fmt = "italic" },
		builtin = { fg = p.blu_0, fmt = "italic" },
		norm = { fg = p.blu_1, fmt = "italic" },
		def = { fg = p.blu_2, fmt = "bold" },
	},

	num = { fg = p.pnk_2 },
	bool = { fg = p.cyn_2 },
	float = { fg = p.pnk_4 },
	operator = { fg = p.prp_4 },

	link = { fg = p.tyr_3 },
	specialchar = { fg = p.sky_0 },
	special = { fg = p.sky_2 },
	h1 = { fg = p.sky_2 },
}

return thalamus
