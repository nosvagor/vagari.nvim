local p = require("vagari.palette")
local semantics = {}

-- 📖 abstract {{{

semantics.abstract = {
	-- background/dark
	adaptiblity = p.dark_0,
	wonder = p.drk_1,
	curiosity = p.drk_2,
	-- foreground/bright
	familiarity = p.brt_0,
	focus = p.brt_2,
	humility = p.brt_1,
	-- black
	sophistication = p.blk_0,
	rebellion = p.blk_1,
	mystery = p.blk_2,
	-- white
	organization = p.wht_0,
	harmony = p.wht_1,
	simplicity = p.wht_2,
	-- blue
	serenity = p.blu_1,
	freedom = p.blu_2,
	infinity = p.blu_3,
	-- orange
	ambition = p.orn_1,
	novelty = p.orn_2,
	significance = p.orn_3,
	-- green
	creation = p.grn_1,
	growth = p.grn_2,
	intuition = p.grn_3,
	-- purple
	cultivation = p.prp_1,
	control = p.prp_2,
	logic = p.prp_3,
	-- emerald
	opportunity = p.emr_1,
	confidence = p.emr_2,
	prosperity = p.emr_3,
	-- ruby
	regulation = p.rby_1,
	tension = p.rby_2,
	power = p.rby_3,
	-- cyan
	discipline = p.cyn_1,
	wisdom = p.cyn_2,
	honesty = p.cyn_3,
	-- pink
	innovation = p.pnk_1,
	courage = p.pnk_2,
	resilience = p.pnk_3,
	-- sun
	discovery = p.sun_1,
	creativity = p.sun_2,
	optimism = p.sun_3,
	-- sky
	balance = p.sky_1,
	productivity = p.sky_2,
	pragmatism = p.sky_3,
	-- histidine
	positive = p.his_3,
	proton = p.his_3,
	high = p.his_3,
	hot = p.his_3,
	right = p.his_3,
	forward = p.his_3,
	increase = p.his_3,
	give = p.his_3,
	acid = p.his_3,
	-- glutamic
	negative = p.glu_3,
	electron = p.glu_3,
	low = p.glu_3,
	cold = p.glu_3,
	left = p.glu_3,
	backward = p.glu_3,
	decrease = p.glu_3,
	take = p.glu_3,
	base = p.glu_3,
	-- aparagine
	neutral = p.asn_3,
	external = p.asn_3,
	outside = p.asn_3,
	indifferent = p.asn_3,
	observer = p.asn_3,
	former = p.asn_3,
	-- proline
	internal = p.pro_3,
	inside = p.pro_3,
	special = p.pro_3,
	participant = p.pro_3,
	latter = p.pro_3,
	-- tyrosine
	link = p.tyr_3,
	combine = p.tyr_3,
	move = p.tyr_3,
	action = p.tyr_3,
	cycle = p.tyr_3,
	group = p.tyr_3,
	-- grey
	normality = p.gry_1,
	passivity = p.gry_3,
	indecision = p.gry_5,
	-- slate
	flexiblity = p.slt_1,
	receptivity = p.slt_3,
	forgiveness = p.slt_5,
	-- rust
	cooperation = p.rst_1,
	hospitality = p.rst_3,
	stability = p.rst_5,
	-- plum
	relaxation = p.plm_1,
	grace = p.plm_3,
	amicability = p.plm_5,
	-- olive
	uncertainty = p.olv_1,
	exploration = p.olv_3,
	obscurity = p.olv_5,
}

-- }}}

-- 🧩 syntax {{{

semantics.syntax = {
	Comment = { fg = p.slt_2 },
	Constant = { fg = p.orn_1 },
	String = { fg = p.grn_4 },
	Character = { fg = p.grn_2 },
	Number = { fg = p.pnk_3 },
	Boolean = { fg = p.cyn_3 },
	Float = { fg = p.pnk_4 },
	Identifier = { fg = p.asn_3 },
	Function = { fg = p.orn_3 },
	Statement = { fg = p.prp_4 },
	Conditional = { fg = p.prp_2 },
	Repeat = { fg = p.prp_3 },
	Label = { fg = p.asn_3 },
	Operator = { fg = p.cyn_4 },
	Keyword = { fg = p.prp_4 },
	Exception = { fg = p.prp_2 },
	PreProc = { fg = p.blu_4 },
	Include = { fg = p.blu_3 },
	Define = { fg = p.blu_2 },
	Macro = { fg = p.blu_2 },
	PreCondit = { fg = p.blu_1 },
	Type = { fg = p.sun_4 },
	StorageClass = { fg = p.sun_3 },
	Structure = { fg = p.sun_2 },
	Typedef = { fg = p.sun_3 },
	Special = { fg = p.sky_4 },
	SpecialChar = { fg = p.sky_2 },
	Title = { fg = p.sky_4 },
	Tag = { fg = p.sky_3 },
	Delimiter = { fg = p.sky_2 },
	SpecialComment = { fg = p.sky_0 },
	Debug = { fg = p.sky_1 },
	Underlined = { fg = p.tyr_3 },
	Ignore = { fg = p.gry_2 },
	Error = { fg = p.rby_3 },
	Todo = { fg = p.orn_4 },
}

-- }}}

-- 📚 lsp {{{

semantics.lsp = {
	Default = {},
	Array = {},
	Boolean = {},
	Class = {},
	Color = {},
	Constant = {},
	Constructor = {},
	Enum = {},
	EnumMember = {},
	Event = {},
	Field = {},
	File = {},
	Folder = {},
	Function = {},
	Interface = {},
	Key = {},
	Keyword = {},
	Method = {},
	Module = {},
	Namespace = {},
	Null = {},
	Number = {},
	Object = {},
	Operator = {},
	Package = {},
	Property = {},
	Reference = {},
	Snippet = {},
	String = {},
	Struct = {},
	Text = {},
	TypeParameter = {},
	Unit = {},
	Value = {},
	Variable = {},
}

-- }}}

-- 👀 UI {{{

semantics.ui = {
	Action = {
		Like = {},
		Follow = {},
		Subscribe = {},
		Donate = {},
		Share = {},
		Comment = {},
	},
	Attention = {
		New = {},
		Old = {},
		Trending = {},
	},
	Buttons = {
		Hover = {},
		Inactive = {},
		Sliders = {},
		Toggles = {},
		Checkbox = {},
	},
	Breadcrumbs = {
		Previous = {},
		Next = {},
		Current = {},
		Related = {},
	},
	Messages = {
		Standard = {},
		Error = {},
		Success = {},
		Warning = {},
		Important = {},
		Critical = {},
		Minor = {},
		Continuous = {},
	},
	Input = {
		Inner = {},
		Outer = {},
		Border = {},
	},
	Disabled = {
		Broken = {},
		Locked = {},
		Hidden = {},
	},
	Emphasis = {
		Min = {},
		Minor = {},
		Normal = {},
		Major = {},
		Max = {},
	},
	Folds = {
		Open = {},
		Closed = {},
	},
	Graphs = {
		Categories = {},
		Node = {},
		Ramp = {},
		Relation = {},
		Sets = {},
	},
	Headings = {
		h1 = {},
		h2 = {},
		h3 = {},
		h4 = {},
		h5 = {},
		h6 = {},
	},
	Icons = {
		Occupied = {},
		Empty = {},
		Inactive = {},
		Active = {},
	},
	Links = {
		New = {},
		Visited = {},
		Internal = {},
		Exterenal = {},
		Images = {},
		Video = {},
	},
	Menu = {
		Context = {},
		DropDown = {},
		Mega = {},
		Modal = {},
		Tooltips = {},
	},
	Help = {
		Indicator = {},
		Relevant = {},
	},
	Tables = {
		Header = {},
		Row = {},
		Column = {},
		Border = {},
	},
	Progress = {
		Loading = {},
		Paused = {},
		Begin = {},
		Finished = {},
	},
	Search = {
		Active = {},
		Inactive = {},
		Match = {},
		First = {},
		Highilight = {},
	},
	Selection = {
		Copied = {},
		Active = {},
		Inactive = {},
	},
}

-- }}}

return semantics
