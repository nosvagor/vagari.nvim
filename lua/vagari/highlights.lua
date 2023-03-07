-- ============================================================================
-- 🧰 setup {{{
local p = require("vagari.palette")
local s = require("vagari.semantics")

local highlights = {}
local hl = {}

local function vim_highlights(hl_groups)
	for group_name, group_settings in pairs(hl_groups) do
		vim.api.nvim_command( string.format(
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

	vim_highlights(hl.editor)
	vim_highlights(hl.syntax)
	-- vim_highlights(hl.treesitter)

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

-- 🗞️ editor {{{
hl.editor = {
	Normal = { fg = p.fg, bg = p.bg },
	Terminal = {},
	EndOfBuffer = {},
	FoldColumn = {},
	Folded = { fg = p.drk_3, bg = p.drk_0 },
	SignColumn = {},
	ToolbarLine = {},
	Cursor = {},
	vCursor = {},
	iCursor = {},
	lCursor = {},
	CursorIM = {},
	CursorColumn = {},
	CursorLine = {},
	ColorColumn = {},
	CursorLineNr = {},
	LineNr = {},
	Conceal = {},
	DiffAdd = {},
	DiffChange = {},
	DiffDelete = {},
	DiffText = {},
	DiffAdded = {},
	DiffRemoved = {},
	DiffFile = {},
	DiffIndexLine = {},
	Directory = {},
	ErrorMsg = {},
	WarningMsg = {},
	MoreMsg = {},
	IncSearch = {},
	Search = {},
	Substitute = {},
	MatchParen = {},
	NonText = {},
	Whitespace = {},
	SpecialKey = {},
	Pmenu = {},
	PmenuSbar = {},
	PmenuSel = {},
	WildMenu = {},
	PmenuThumb = {},
	Question = {},
	SpellBad = {},
	SpellCap = {},
	SpellLocal = {},
	SpellRare = {},
	StatusLine = {},
	StatusLineTerm = {},
	StatusLineNC = {},
	StatusLineTermNC = {},
	TabLine = {},
	TabLineFill = {},
	TabLineSel = {},
	VertSplit = {},
	Visual = {},
	VisualNOS = {},
	QuickFixLine = {},
	Debug = {},
	debugPC = {},
	debugBreakpoint = {},
	ToolbarButton = {},
	FloatBorder = {},
	NormalFloat = {},
}
-- }}}

-- 🌐 syntax {{{
hl.syntax = {
	Boolean = { s.syntax.Boolean },
	Character = { s.syntax.Character },
	Comment = { s.syntax.Comment },
	Conditional = { s.syntax.Conditional },
	Constant = { s.syntax.Constant },
	Define = { s.syntax.Define },
	Delimiter = { s.syntax.Delimiter },
	Error = { s.syntax.Error },
	Exception = { s.syntax.Exception },
	Float = { s.syntax.Float },
	Function = { s.syntax.Function },
	Identifier = { s.syntax.Identifier },
	Include = { s.syntax.Include },
	Keyword = { s.syntax.Keyword },
	Label = { s.syntax.Label },
	Macro = { s.syntax.Macro },
	Number = { s.syntax.Number },
	Operator = { s.syntax.Operator },
	PreCondit = { s.syntax.PreProc },
	PreProc = { s.syntax.PreProc },
	Repeat = { s.syntax.Repeat },
	Special = { s.syntax.Special },
	SpecialChar = { s.syntax.SpecialChar },
	SpecialComment = { s.syntax.SpecialComment },
	Statement = { s.syntax.Statement },
	StorageClass = { s.syntax.StorageClass },
	String = { s.syntax.String },
	Structure = { s.syntax.Structure },
	Tag = { s.syntax.Tag },
	Title = { s.syntax.Title },
	Todo = { s.syntax.Todo },
	Type = { s.syntax.Type },
	Typedef = { s.syntax.Typedef },
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
