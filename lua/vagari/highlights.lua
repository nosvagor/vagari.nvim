-- ============================================================================
-- 🧰 setup {{{
local p = require("vagari.palette")
local l = require("vagari.links")

local highlights = {}
local hl = {
	builtin = {},
	treesitter = {},
	filetypes = {},
	plugins = {},
}

local function vim_highlights(hl_groups)
	for group_name, group_settings in pairs(hl_groups) do
		vim.api.nvim_command(
			string.format(
				"highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
				group_name,
				group_settings.fg or "none",
				group_settings.bg or "none",
				group_settings.sp or "none",
				group_settings.fmt or "none"
			)
		)
	end
end

function highlights.setup()
	-- for kind, color in pairs(s.lsp) do
	-- 	hl.plugins.cmp["CmpItemKind" .. kind] = { fg = color }
	-- 	hl.plugins.outline["Aerial" .. kind .. "Icon"] = { fg = color }
	-- 	hl.plugins.navic["NavicIcons" .. kind] = { fg = color }
	-- end

	vim_highlights(hl.builtin)
	vim_highlights(l.syntax)
	-- vimhighlights(hl.treesitter)

	-- for _, group in pairs(hl.filetypes) do
	-- 	vim_highlights(group)
	-- end
	--
	-- for _, group in pairs(hl.plugins) do
	-- 	vim_highlights(group)
	-- end
end
-- }}}
-- ============================================================================

-- 🔋 builtin {{{
hl.builtin = {
	ColorColumn = { fg = p.drk_0},
	Conceal = { fg = p.slt_1},
	CurSearch = { fg = p.orn_4, bg = p.drk_0},
	Cursor = { fg = p.bg, bg = p.brt_1},
	lCursor = { fg = p.bg, bg = p.brt_1},
	CursorIM = { fg = p.bg, bg = p.brt_1},
	CursorColumn = { fg = p.drk_0},
	CursorLine = { fg = p.drk_0},
	Directory = { fg = p.sky_2},
	DiffAdd = { fg = p.tyr_2},
	DiffChange = { fg = p.asn_2},
	DiffDelete = { fg = p.his_2},
	DiffText = { fg = p.glu_2},
	EndOfBuffer = { fg = p.bg},
	TermCursor = { fg = p.bg, bg = p.brt_1 },
	TermCursorNC = { fg = p.bg, bg = p.brt_1 },
	ErrorMsg = { fg = p.rby_1},
	WinSeparator = { fg = p.blu_3},
	Folded = { fg = p.slt_3, bg = p.drk_0},
	FoldColumn = { fg = p.slt_3,bg =  p.drk_0},
	SignColumn = { fg = p.slt_3,bg =  p.drk_0},
	IncSearch = { fg = p.orn_4, bg = p.slt_0},
	Substitute = { fg = p.orn_4, bg = p.slt_0},
	LineNr = { fg = p.asn_0 },
	LineNrAbove = { fg = p.his_0 },
	LineNrBelow = { fg = p.glu_0 },
	CursorLineNr = { fg = p.asn_0 },
	CursorLineSign = { fg = p.asn_0 },
	CursorLineFold = { fg = p.asn_0 },
	MatchParen = { fg = p.orn_4 },
	ModeMsg = { fg = p.slt_5 },
	MsgArea = { fg = p.slt_5 },
	MsgSeparator = { fg = p.blu_2 },
	MoreMsg = { fg = p.blu_3 },
	NonText = { fg = p.drk_0 },
	Normal = { fg = p.fg, bg = p.bg },
	NormalFloat = { fg = p.brt_1 },
	NormalNC = { fg = p.fg },
	Pmenu = { fg = p.fg, bg = p.slt_0 },
	PmenuSel = { fg = p.brt_2, p.bg },
	PmenuSbar = { fg = p.slt_2 },
	PmenuThumb = { fg = p.slt_5 },
	Question = { fg = p.blu_4 },
	QuickFixLine = { fg = p.brt_3 },
	Search = { fg = p.orn_4 },
	SpecialKey = { fg = p.olv_2 },
	SpellBad = { fg = p.rby_1 },
	SpellCap = { fg = p.sky_1 },
	SpellLocal = { fg = p.cyn_1 },
	SpellRare = { fg = p.pnk_1 },
	StatusLine = { fg = p.drk_0 },
	StatusLineNC = { fg = p.drk_0 },
	TabLine = { fg = p.drk_0 },
	TabLineFill = { fg = p.dark_1 },
	TabLineSel = { fg = p.orn_4 },
	Title = { fg = p.sky_4 },
	Visual = { fg = p.slt_0 },
	VisualNOS = { fg = p.plm_0 },
	WarningMsg = { fg = p.sun_4 },
	Whitespace = { fg = p.slt_2 },
	WildMenu = { fg = p.blu_2 },
	WinBar = { fg = p.drk_0 },
	WinBarNC = { fg = p.drk_0 },
}
-- }}}

-- 🎄 treesitter {{{
hl.treesitter = {
	["@annotation"] = {},
	["@attribute"] = {},
	["@boolean"] = {},
	["@character"] = {},
	["@comment"] = {},
	["@conditional"] = {},
	["@constant"] = {},
	["@constant.builtin"] = {},
	["@constant.macro"] = {},
	["@constructor"] = {},
	["@error"] = {},
	["@exception"] = {},
	["@field"] = {},
	["@float"] = {},
	["@function"] = {},
	["@function.builtin"] = {},
	["@function.macro"] = {},
	["@include"] = {},
	["@keyword"] = {},
	["@keyword.function"] = {},
	["@keyword.operator"] = {},
	["@label"] = {},
	["@method"] = {},
	["@namespace"] = {},
	["@none"] = {},
	["@number"] = {},
	["@operator"] = {},
	["@parameter"] = {},
	["@parameter.reference"] = {},
	["@property"] = {},
	["@punctuation.delimiter"] = {},
	["@punctuation.bracket"] = {},
	["@punctuation.special"] = {},
	["@repeat"] = {},
	["@string"] = {},
	["@string.regex"] = {},
	["@string.escape"] = {},
	["@symbol"] = {},
	["@tag"] = {},
	["@tag.attribute"] = {},
	["@tag.delimiter"] = {},
	["@text"] = {},
	["@text.strong"] = {},
	["@text.emphasis"] = {},
	["@text.underline"] = {},
	["@text.strike"] = {},
	["@text.title"] = {},
	["@text.literal"] = {},
	["@text.uri"] = {},
	["@text.todo"] = {},
	["@text.math"] = {},
	["@text.reference"] = {},
	["@text.environment"] = {},
	["@text.environment.name"] = {},
	["@text.diff.add"] = {},
	["@text.diff.delete"] = {},
	["@note"] = {},
	["@warning"] = {},
	["@danger"] = {},
	["@type"] = {},
	["@type.builtin"] = {},
	["@variable"] = {},
	["@variable.builtin"] = {},
}

-- }}}

-- 🗃️ filetypes {{{
hl.filetypes.markdown = {
	markdownBlockquote = {},
	markdownBold = {},
	markdownBoldDelimiter = {},
	markdownCode = {},
	markdownCodeBlock = {},
	markdownCodeDelimiter = {},
	markdownH1 = {},
	markdownH2 = {},
	markdownH3 = {},
	markdownH4 = {},
	markdownH5 = {},
	markdownH6 = {},
	markdownHeadingDelimiter = {},
	markdownHeadingRule = {},
	markdownId = {},
	markdownIdDeclaration = {},
	markdownItalic = {},
	markdownItalicDelimiter = {},
	markdownLinkDelimiter = {},
	markdownLinkText = {},
	markdownLinkTextDelimiter = {},
	markdownListMarker = {},
	markdownOrderedListMarker = {},
	markdownRule = {},
	markdownUrl = {},
	markdownUrlDelimiter = {},
	markdownUrlTitleDelimiter = {},
}

-- }}}

-- 🔌 plugins {{{

hl.plugins.lsp = {
	LspCxxHlGroupEnumConstant = {},
	LspCxxHlGroupMemberVariable = {},
	LspCxxHlGroupNamespace = {},
	LspCxxHlSkippedRegion = {},
	LspCxxHlSkippedRegionBeginEnd = {},

	DiagnosticError = {},
	DiagnosticHint = {},
	DiagnosticInfo = {},
	DiagnosticWarn = {},

	DiagnosticVirtualTextError = {},
	DiagnosticVirtualTextWarn = {},
	DiagnosticVirtualTextInfo = {},
	DiagnosticVirtualTextHint = {},

	DiagnosticUnderlineError = {},
	DiagnosticUnderlineHint = {},
	DiagnosticUnderlineInfo = {},
	DiagnosticUnderlineWarn = {},

	LspReferenceText = {},
	LspReferenceWrite = {},
	LspReferenceRead = {},

	LspCodeLens = {},
	LspCodeLensSeparator = {},
}

hl.plugins.cmp = {
	CmpItemAbbr = {},
	CmpItemAbbrDeprecated = {},
	CmpItemAbbrMatch = {},
	CmpItemAbbrMatchFuzzy = {},
	CmpItemMenu = {},
	CmpItemKind = {},
}

hl.plugins.whichkey = {
	WhichKey = {},
	WhichKeyDesc = {},
	WhichKeyGroup = {},
	WhichKeySeperator = {},
}

-- comment
hl.plugins.diffview = {
	DiffviewFilePanelTitle = {},
	DiffviewFilePanelCounter = {},
	DiffviewFilePanelFileName = {},
	DiffviewNormal = {},
	DiffviewCursorLine = {},
	DiffviewVertSplit = {},
	DiffviewSignColumn = {},
	DiffviewStatusLine = {},
	DiffviewStatusLineNC = {},
	DiffviewEndOfBuffer = {},
	DiffviewFilePanelRootPath = {},
	DiffviewFilePanelPath = {},
	DiffviewFilePanelInsertions = {},
	DiffviewFilePanelDeletions = {},
	DiffviewStatusAdded = {},
	DiffviewStatusUntracked = {},
	DiffviewStatusModified = {},
	DiffviewStatusRenamed = {},
	DiffviewStatusCopied = {},
	DiffviewStatusTypeChange = {},
	DiffviewStatusUnmerged = {},
	DiffviewStatusUnknown = {},
	DiffviewStatusDeleted = {},
	DiffviewStatusBroken = {},
}

hl.plugins.gitsigns = {
	GitSignsAdd = {},
	GitSignsAddLn = {},
	GitSignsAddNr = {},
	GitSignsChange = {},
	GitSignsChangeLn = {},
	GitSignsChangeNr = {},
	GitSignsDelete = {},
	GitSignsDeleteLn = {},
	GitSignsDeleteNr = {},
}

hl.plugins.neo_tree = {
	NeoTreeNormal = {},
	NeoTreeNormalNC = {},
	NeoTreeVertSplit = {},
	NeoTreeWinSeparator = {},
	NeoTreeEndOfBuffer = {},
	NeoTreeRootName = {},
	NeoTreeGitAdded = {},
	NeoTreeGitDeleted = {},
	NeoTreeGitModified = {},
	NeoTreeGitConflict = {},
	NeoTreeGitUntracked = {},
	NeoTreeIndentMarker = {},
	NeoTreeSymbolicLinkTarget = {},
}

hl.plugins.neotest = {
	NeotestAdapterName = {},
	NeotestDir = {},
	NeotestExpandMarker = {},
	NeotestFailed = {},
	NeotestFile = {},
	NeotestFocused = {},
	NeotestIndent = {},
	NeotestMarked = {},
	NeotestNamespace = {},
	NeotestPassed = {},
	NeotestRunning = {},
	NeotestWinSelect = {},
	NeotestSkipped = {},
	NeotestTarget = {},
	NeotestTest = {},
	NeotestUnknown = {},
}

hl.plugins.nvim_tree = {
	NvimTreeNormal = {},
	NvimTreeVertSplit = {},
	NvimTreeEndOfBuffer = {},
	NvimTreeRootFolder = {},
	NvimTreeGitDirty = {},
	NvimTreeGitNew = {},
	NvimTreeGitDeleted = {},
	NvimTreeSpecialFile = {},
	NvimTreeIndentMarker = {},
	NvimTreeImageFile = {},
	NvimTreeSymlink = {},
	NvimTreeFolderName = {},
}

hl.plugins.telescope = {
	TelescopeBorder = {},
	TelescopePromptBorder = {},
	TelescopeResultsBorder = {},
	TelescopePreviewBorder = {},
	TelescopeMatching = {},
	TelescopePromptPrefix = {},
	TelescopeSelection = {},
	TelescopeSelectionCaret = {},
}

hl.plugins.dashboard = {
	DashboardShortCut = {},
	DashboardHeader = {},
	DashboardCenter = {},
	DashboardFooter = {},
}

hl.plugins.outline = {
	FocusedSymbol = {},
	AerialLine = {},
}

hl.plugins.navic = {
	NavicText = {},
	NavicSeparator = {},
}

hl.plugins.ts_rainbow = {
	rainbowcol1 = {},
	rainbowcol2 = {},
	rainbowcol3 = {},
	rainbowcol4 = {},
	rainbowcol5 = {},
	rainbowcol6 = {},
	rainbowcol7 = {},
}

hl.plugins.indent_blankline = {
	IndentBlanklineIndent1 = {},
	IndentBlanklineIndent2 = {},
	IndentBlanklineIndent3 = {},
	IndentBlanklineIndent4 = {},
	IndentBlanklineIndent5 = {},
	IndentBlanklineIndent6 = {},
	IndentBlanklineChar = {},
	IndentBlanklineContext = {},
	IndentBlanklineContextChar = {},
	IndentBlanklineContextStart = {},
	IndentBlanklineContextSpaceChar = {},
}
-- }}}

return highlights

-- :so $VIMRUNTIME/syntax/hitest.vim
-- :h group-name
-- :h highlight
