local p = require("vagari.palette")

local vagari = {
	normal = {
		a = { bg = p.blu_2, fg = p.drk_0 },
		b = { fg = p.blu_2, bg = p.glc_1 },
		c = { fg = p.glc_4, bg = p.drk_0 },
	},
	insert = {
		a = { bg = p.grn_2, fg = p.drk_0 },
		b = { fg = p.grn_2, bg = p.glc_1 },
	},
	command = {
		a = { bg = p.orn_2, fg = p.drk_0 },
		b = { fg = p.orn_3, bg = p.glc_1 },
	},
	visual = {
		a = { bg = p.prp_2, fg = p.drk_0 },
		b = { fg = p.prp_2, bg = p.glc_1 },
	},
	replace = {
		a = { bg = p.emr_2, fg = p.drk_0 },
		b = { fg = p.emr_2, bg = p.glc_1 },
	},
	-- inactive = { -- TODO: (inactive color config not tested)
	-- 	a = {},
	-- 	b = {},
	-- 	c = {},
	-- },
}

return vagari
