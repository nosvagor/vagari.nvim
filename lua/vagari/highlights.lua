local p = require("vagari.palette")
local s = require("vagari.semantic")
local c = vim.g.vagari.config

local highlights = {}
local hl = { filetypes = {}, plugins = {} }

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

-- test -> :so $VIMRUNTIME/syntax/hitest.vim
-- :h group-name
-- :h highlight

hl.common = {
	Normal = { fg = p.fg, bg = c.transparent and p.none or p.bg0 },
	Terminal = { fg = p.fg, bg = c.transparent and p.none or p.bg0 },
	EndOfBuffer = {
		fg = c.ending_tildes and p.bg2 or p.bg0,
		bg = c.transparent and p.none or p.bg0,
	},
	FoldColumn = { fg = p.fg, bg = c.transparent and p.none or p.bg1 },
	Folded = { fg = p.fg, bg = c.transparent and p.none or p.bg1 },
	SignColumn = { fg = p.fg, bg = c.transparent and p.none or p.bg0 },
	ToolbarLine = { fg = p.fg },
	Cursor = { fmt = "reverse" },
	vCursor = { fmt = "reverse" },
	iCursor = { fmt = "reverse" },
	lCursor = { fmt = "reverse" },
	CursorIM = { fmt = "reverse" },
	CursorColumn = { bg = p.bg1 },
	CursorLine = { bg = p.bg1 },
	ColorColumn = { bg = p.bg1 },
	CursorLineNr = { fg = p.fg },
	LineNr = { fg = p.grey },
	Conceal = { fg = p.grey, bg = p.bg1 },
	DiffAdd = { fg = p.none, bg = p.diff_add },
	DiffChange = { fg = p.none, bg = p.diff_change },
	DiffDelete = { fg = p.none, bg = p.diff_delete },
	DiffText = { fg = p.none, bg = p.diff_text },
	DiffAdded = p.Green,
	DiffRemoved = p.Red,
	DiffFile = p.Cyan,
	DiffIndexLine = p.Grey,
	Directory = { fg = p.blue },
	ErrorMsg = { fg = p.red, fmt = "bold" },
	WarningMsg = { fg = p.yellow, fmt = "bold" },
	MoreMsg = { fg = p.blue, fmt = "bold" },
	IncSearch = { fg = p.bg0, bg = p.orange },
	Search = { fg = p.bg0, bg = p.bg_yellow },
	Substitute = { fg = p.bg0, bg = p.green },
	MatchParen = { fg = p.none, bg = p.grey },
	NonText = { fg = p.grey },
	Whitespace = { fg = p.grey },
	SpecialKey = { fg = p.grey },
	Pmenu = { fg = p.fg, bg = p.bg1 },
	PmenuSbar = { fg = p.none, bg = p.bg1 },
	PmenuSel = { fg = p.bg0, bg = p.bg_blue },
	WildMenu = { fg = p.bg0, bg = p.blue },
	PmenuThumb = { fg = p.none, bg = p.grey },
	Question = { fg = p.yellow },
	SpellBad = { fg = p.red, fmt = "underline", sp = p.red },
	SpellCap = { fg = p.yellow, fmt = "underline", sp = p.yellow },
	SpellLocal = { fg = p.blue, fmt = "underline", sp = p.blue },
	SpellRare = { fg = p.purple, fmt = "underline", sp = p.purple },
	StatusLine = { fg = p.fg, bg = p.bg2 },
	StatusLineTerm = { fg = p.fg, bg = p.bg2 },
	StatusLineNC = { fg = p.grey, bg = p.bg1 },
	StatusLineTermNC = { fg = p.grey, bg = p.bg1 },
	TabLine = { fg = p.fg, bg = p.bg1 },
	TabLineFill = { fg = p.grey, bg = p.bg1 },
	TabLineSel = { fg = p.bg0, bg = p.fg },
	VertSplit = { fg = p.bg3 },
	Visual = { bg = p.bg3 },
	VisualNOS = { fg = p.none, bg = p.bg2, fmt = "underline" },
	QuickFixLine = { fg = p.blue, fmt = "underline" },
	Debug = { fg = p.yellow },
	debugPC = { fg = p.bg0, bg = p.green },
	debugBreakpoint = { fg = p.bg0, bg = p.red },
	ToolbarButton = { fg = p.bg0, bg = p.bg_blue },
	FloatBorder = { fg = p.grey, bg = p.bg1 },
	NormalFloat = { fg = p.fg, bg = p.bg1 },
}

hl.syntax = {
	String = { fg = p.green, fmt = c.code_style.strings },
	Character = p.Orange,
	Number = p.Orange,
	Float = p.Orange,
	Boolean = p.Orange,
	Type = p.Yellow,
	Structure = p.Yellow,
	StorageClass = p.Yellow,
	Identifier = { fg = p.red, fmt = c.code_style.variables },
	Constant = p.Cyan,
	PreProc = p.Purple,
	PreCondit = p.Purple,
	Include = p.Purple,
	Keyword = { fg = p.purple, fmt = c.code_style.keywords },
	Define = p.Purple,
	Typedef = p.Purple,
	Exception = p.Purple,
	Conditional = { fg = p.purple, fmt = c.code_style.keywords },
	Repeat = { fg = p.purple, fmt = c.code_style.keywords },
	Statement = p.Purple,
	Macro = p.Red,
	Error = p.Purple,
	Label = p.Purple,
	Special = p.Red,
	SpecialChar = p.Red,
	Function = { fg = p.blue, fmt = c.code_style.functions },
	Operator = p.Purple,
	Title = p.Cyan,
	Tag = p.Green,
	Delimiter = p.LightGrey,
	Comment = { fg = p.grey, fmt = c.code_style.comments },
	SpecialComment = { fg = p.grey, fmt = c.code_style.comments },
	Todo = { fg = p.red, fmt = c.code_style.comments },
}

hl.treesitter = {
    ["@annotation"] = p.Fg,
    ["@attribute"] = p.Cyan,
    ["@boolean"] = p.Orange,
    ["@character"] = p.Orange,
    ["@comment"] = { fg = p.grey, fmt = c.code_style.comments },
    ["@conditional"] = { fg = p.purple, fmt = c.code_style.keywords },
    ["@constant"] = p.Orange,
    ["@constant.builtin"] = p.Orange,
    ["@constant.macro"] = p.Orange,
    ["@constructor"] = { fg = p.yellow, fmt = "bold" },
    ["@error"] = p.Fg,
    ["@exception"] = p.Purple,
    ["@field"] = p.Cyan,
    ["@float"] = p.Orange,
    ["@function"] = { fg = p.blue, fmt = c.code_style.functions },
    ["@function.builtin"] = { fg = p.cyan, fmt = c.code_style.functions },
    ["@function.macro"] = { fg = p.cyan, fmt = c.code_style.functions },
    ["@include"] = p.Purple,
    ["@keyword"] = { fg = p.purple, fmt = c.code_style.keywords },
    ["@keyword.function"] = { fg = p.purple, fmt = c.code_style.functions },
    ["@keyword.operator"] = { fg = p.purple, fmt = c.code_style.keywords },
    ["@label"] = p.Red,
    ["@method"] = p.Blue,
    ["@namespace"] = p.Yellow,
    ["@none"] = p.Fg,
    ["@number"] = p.Orange,
    ["@operator"] = p.Fg,
    ["@parameter"] = p.Red,
    ["@parameter.reference"] = p.Fg,
    ["@property"] = p.Cyan,
    ["@punctuation.delimiter"] = p.LightGrey,
    ["@punctuation.bracket"] = p.LightGrey,
    ["@punctuation.special"] = p.Red,
    ["@repeat"] = { fg = p.purple, fmt = c.code_style.keywords },
    ["@string"] = { fg = p.green, fmt = c.code_style.strings },
    ["@string.regex"] = { fg = p.orange, fmt = c.code_style.strings },
    ["@string.escape"] = { fg = p.red, fmt = c.code_style.strings },
    ["@symbol"] = p.Cyan,
    ["@tag"] = p.Purple,
    ["@tag.attribute"] = p.Yellow,
    ["@tag.delimiter"] = p.Purple,
    ["@text"] = p.Fg,
    ["@text.strong"] = { fg = p.fg, fmt = "bold" },
    ["@text.emphasis"] = { fg = p.fg, fmt = "italic" },
    ["@text.underline"] = { fg = p.fg, fmt = "underline" },
    ["@text.strike"] = { fg = p.fg, fmt = "strikethrough" },
    ["@text.title"] = { fg = p.orange, fmt = "bold" },
    ["@text.literal"] = p.Green,
    ["@text.uri"] = { fg = p.cyan, fmt = "underline" },
    ["@text.todo"] = { fg = p.red, fmt = c.code_style.comments },
    ["@text.math"] = p.Fg,
    ["@text.reference"] = p.Blue,
    ["@text.environment"] = p.Fg,
    ["@text.environment.name"] = p.Fg,
    ["@text.diff.add"] = p.Green,
    ["@text.diff.delete"] = p.Red,
    ["@note"] = p.Fg,
    ["@warning"] = p.Fg,
    ["@danger"] = p.Fg,
    ["@type"] = p.Yellow,
    ["@type.builtin"] = p.Orange,
    ["@variable"] = { fg = p.fg, fmt = c.code_style.variables },
    ["@variable.builtin"] = { fg = p.red, fmt = c.code_style.variables },
}

local diagnostics_error_color = c.diagnostics.darker and p.dark_red or p.red
local diagnostics_hint_color = c.diagnostics.darker and p.dark_purple
	or p.purple
local diagnostics_warn_color = c.diagnostics.darker and p.dark_yellow
	or p.yellow
local diagnostics_info_color = c.diagnostics.darker and p.dark_cyan or p.cyan

hl.plugins.lsp = {
	LspCxxHlGroupEnumConstant = p.Orange,
	LspCxxHlGroupMemberVariable = p.Orange,
	LspCxxHlGroupNamespace = p.Blue,
	LspCxxHlSkippedRegion = p.Grey,
	LspCxxHlSkippedRegionBeginEnd = p.Red,

	DiagnosticError = { fg = p.red },
	DiagnosticHint = { fg = p.purple },
	DiagnosticInfo = { fg = p.cyan },
	DiagnosticWarn = { fg = p.yellow },

	DiagnosticVirtualTextError = {
		bg = p.bg or p.none,
		fg = diagnostics_error_color,
	},
	DiagnosticVirtualTextWarn = {
		bg = p.bg or p.none,
		fg = diagnostics_warn_color,
	},
	DiagnosticVirtualTextInfo = {
		bg = p.bg or p.none,
		fg = diagnostics_info_color,
	},
	DiagnosticVirtualTextHint = {
		bg = p.bg or p.none,
		fg = diagnostics_hint_color,
	},

	DiagnosticUnderlineError = {
		fmt = c.diagnostics.undercurl and "undercurl" or "underline",
		sp = p.red,
	},
	DiagnosticUnderlineHint = {
		fmt = c.diagnostics.undercurl and "undercurl" or "underline",
		sp = p.purple,
	},
	DiagnosticUnderlineInfo = {
		fmt = c.diagnostics.undercurl and "undercurl" or "underline",
		sp = p.blue,
	},
	DiagnosticUnderlineWarn = {
		fmt = c.diagnostics.undercurl and "undercurl" or "underline",
		sp = p.yellow,
	},

	LspReferenceText = { bg = p.bg2 },
	LspReferenceWrite = { bg = p.bg2 },
	LspReferenceRead = { bg = p.bg2 },

	LspCodeLens = { fg = p.grey, fmt = c.code_style.comments },
	LspCodeLensSeparator = { fg = p.grey },
}

hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
hl.plugins.lsp.LspDiagnosticsUnderlineError =
	hl.plugins.lsp.DiagnosticUnderlineError
hl.plugins.lsp.LspDiagnosticsUnderlineHint =
	hl.plugins.lsp.DiagnosticUnderlineHint
hl.plugins.lsp.LspDiagnosticsUnderlineInformation =
	hl.plugins.lsp.DiagnosticUnderlineInfo
hl.plugins.lsp.LspDiagnosticsUnderlineWarning =
	hl.plugins.lsp.DiagnosticUnderlineWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextError =
	hl.plugins.lsp.DiagnosticVirtualTextError
hl.plugins.lsp.LspDiagnosticsVirtualTextWarning =
	hl.plugins.lsp.DiagnosticVirtualTextWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextInformation =
	hl.plugins.lsp.DiagnosticVirtualTextInfo
hl.plugins.lsp.LspDiagnosticsVirtualTextHint =
	hl.plugins.lsp.DiagnosticVirtualTextHint

hl.plugins.ale = {
	ALEErrorSign = hl.plugins.lsp.DiagnosticError,
	ALEInfoSign = hl.plugins.lsp.DiagnosticInfo,
	ALEWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.barbar = {
	BufferCurrent = { fmt = "bold" },
	BufferCurrentMod = { fg = p.orange, fmt = "bold,italic" },
	BufferCurrentSign = { fg = p.purple },
	BufferInactiveMod = { fg = p.light_grey, bg = p.bg1, fmt = "italic" },
	BufferVisible = { fg = p.light_grey, bg = p.bg0 },
	BufferVisibleMod = { fg = p.yellow, bg = p.bg0, fmt = "italic" },
	BufferVisibleIndex = { fg = p.light_grey, bg = p.bg0 },
	BufferVisibleSign = { fg = p.light_grey, bg = p.bg0 },
	BufferVisibleTarget = { fg = p.light_grey, bg = p.bg0 },
}

hl.plugins.cmp = {
	CmpItemAbbr = p.Fg,
	CmpItemAbbrDeprecated = { fg = p.light_grey, fmt = "strikethrough" },
	CmpItemAbbrMatch = p.Cyan,
	CmpItemAbbrMatchFuzzy = { fg = p.cyan, fmt = "underline" },
	CmpItemMenu = p.LightGrey,
	CmpItemKind = { fg = p.purple, fmt = c.cmp_itemkind_reverse and "reverse" },
}

hl.plugins.coc = {
	CocErrorSign = hl.plugins.lsp.DiagnosticError,
	CocHintSign = hl.plugins.lsp.DiagnosticHint,
	CocInfoSign = hl.plugins.lsp.DiagnosticInfo,
	CocWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.whichkey = {
	WhichKey = p.Red,
	WhichKeyDesc = p.Blue,
	WhichKeyGroup = p.Orange,
	WhichKeySeperator = p.Green,
}

hl.plugins.gitgutter = {
	GitGutterAdd = { fg = p.green },
	GitGutterChange = { fg = p.blue },
	GitGutterDelete = { fg = p.red },
}

hl.plugins.hop = {
	HopNextKey = { fg = p.red, fmt = "bold" },
	HopNextKey1 = { fg = p.cyan, fmt = "bold" },
	HopNextKey2 = { fg = p.blue },
	HopUnmatched = p.Grey,
}

-- comment
hl.plugins.diffview = {
	DiffviewFilePanelTitle = { fg = p.blue, fmt = "bold" },
	DiffviewFilePanelCounter = { fg = p.purple, fmt = "bold" },
	DiffviewFilePanelFileName = p.Fg,
	DiffviewNormal = hl.common.Normal,
	DiffviewCursorLine = hl.common.CursorLine,
	DiffviewVertSplit = hl.common.VertSplit,
	DiffviewSignColumn = hl.common.SignColumn,
	DiffviewStatusLine = hl.common.StatusLine,
	DiffviewStatusLineNC = hl.common.StatusLineNC,
	DiffviewEndOfBuffer = hl.common.EndOfBuffer,
	DiffviewFilePanelRootPath = p.Grey,
	DiffviewFilePanelPath = p.Grey,
	DiffviewFilePanelInsertions = p.Green,
	DiffviewFilePanelDeletions = p.Red,
	DiffviewStatusAdded = p.Green,
	DiffviewStatusUntracked = p.Blue,
	DiffviewStatusModified = p.Blue,
	DiffviewStatusRenamed = p.Blue,
	DiffviewStatusCopied = p.Blue,
	DiffviewStatusTypeChange = p.Blue,
	DiffviewStatusUnmerged = p.Blue,
	DiffviewStatusUnknown = p.Red,
	DiffviewStatusDeleted = p.Red,
	DiffviewStatusBroken = p.Red,
}

hl.plugins.gitsigns = {
	GitSignsAdd = p.Green,
	GitSignsAddLn = p.Green,
	GitSignsAddNr = p.Green,
	GitSignsChange = p.Blue,
	GitSignsChangeLn = p.Blue,
	GitSignsChangeNr = p.Blue,
	GitSignsDelete = p.Red,
	GitSignsDeleteLn = p.Red,
	GitSignsDeleteNr = p.Red,
}

hl.plugins.neo_tree = {
	NeoTreeNormal = { fg = p.fg, bg = c.transparent and p.none or p.bg_d },
	NeoTreeNormalNC = { fg = p.fg, bg = c.transparent and p.none or p.bg_d },
	NeoTreeVertSplit = { fg = p.bg1, bg = c.transparent and p.none or p.bg1 },
	NeoTreeWinSeparator = { fg = p.bg1, bg = c.transparent and p.none or p.bg1 },
	NeoTreeEndOfBuffer = {
		fg = c.ending_tildes and p.bg2 or p.bg_d,
		bg = c.transparent and p.none or p.bg_d,
	},
	NeoTreeRootName = { fg = p.orange, fmt = "bold" },
	NeoTreeGitAdded = p.Green,
	NeoTreeGitDeleted = p.Red,
	NeoTreeGitModified = p.Yellow,
	NeoTreeGitConflict = { fg = p.red, fmt = "bold,italic" },
	NeoTreeGitUntracked = { fg = p.red, fmt = "italic" },
	NeoTreeIndentMarker = p.Grey,
	NeoTreeSymbolicLinkTarget = p.Purple,
}

hl.plugins.neotest = {
	NeotestAdapterName = { fg = p.purple, fmt = "bold" },
	NeotestDir = p.Cyan,
	NeotestExpandMarker = p.Grey,
	NeotestFailed = p.Red,
	NeotestFile = p.Cyan,
	NeotestFocused = { fmt = "bold,italic" },
	NeotestIndent = p.Grey,
	NeotestMarked = { fg = p.orange, fmt = "bold" },
	NeotestNamespace = p.Blue,
	NeotestPassed = p.Green,
	NeotestRunning = p.Yellow,
	NeotestWinSelect = { fg = p.cyan, fmt = "bold" },
	NeotestSkipped = p.LightGrey,
	NeotestTarget = p.Purple,
	NeotestTest = p.Fg,
	NeotestUnknown = p.LightGrey,
}

hl.plugins.nvim_tree = {
	NvimTreeNormal = { fg = p.fg, bg = c.transparent and p.none or p.bg_d },
	NvimTreeVertSplit = { fg = p.bg_d, bg = c.transparent and p.none or p.bg_d },
	NvimTreeEndOfBuffer = {
		fg = c.ending_tildes and p.bg2 or p.bg_d,
		bg = c.transparent and p.none or p.bg_d,
	},
	NvimTreeRootFolder = { fg = p.orange, fmt = "bold" },
	NvimTreeGitDirty = p.Yellow,
	NvimTreeGitNew = p.Green,
	NvimTreeGitDeleted = p.Red,
	NvimTreeSpecialFile = { fg = p.yellow, fmt = "underline" },
	NvimTreeIndentMarker = p.Fg,
	NvimTreeImageFile = { fg = p.dark_purple },
	NvimTreeSymlink = p.Purple,
	NvimTreeFolderName = p.Blue,
}
hl.plugins.telescope = {
	TelescopeBorder = p.Red,
	TelescopePromptBorder = p.Cyan,
	TelescopeResultsBorder = p.Cyan,
	TelescopePreviewBorder = p.Cyan,
	TelescopeMatching = { fg = p.orange, fmt = "bold" },
	TelescopePromptPrefix = p.Green,
	TelescopeSelection = { bg = p.bg2 },
	TelescopeSelectionCaret = p.Yellow,
}

hl.plugins.dashboard = {
	DashboardShortCut = p.Blue,
	DashboardHeader = p.Yellow,
	DashboardCenter = p.Cyan,
	DashboardFooter = { fg = p.dark_red, fmt = "italic" },
}

hl.plugins.outline = {
	FocusedSymbol = { fg = p.purple, bg = p.bg2, fmt = "bold" },
	AerialLine = { fg = p.purple, bg = p.bg2, fmt = "bold" },
}

hl.plugins.navic = {
	NavicText = { fg = p.fg },
	NavicSeparator = { fg = p.light_grey },
}

hl.plugins.ts_rainbow = {
	rainbowcol1 = p.Grey,
	rainbowcol2 = p.Yellow,
	rainbowcol3 = p.Blue,
	rainbowcol4 = p.Orange,
	rainbowcol5 = p.Purple,
	rainbowcol6 = p.Green,
	rainbowcol7 = p.Red,
}

hl.plugins.indent_blankline = {
	IndentBlanklineIndent1 = p.Blue,
	IndentBlanklineIndent2 = p.Green,
	IndentBlanklineIndent3 = p.Cyan,
	IndentBlanklineIndent4 = p.LightGrey,
	IndentBlanklineIndent5 = p.Purple,
	IndentBlanklineIndent6 = p.Red,
	IndentBlanklineChar = { fg = p.bg1, gui = "nocombine" },
	IndentBlanklineContext = { fg = p.orange, bg = p.bg3, bold = true },
	IndentBlanklineContextChar = { fg = p.bg1, gui = "nocombine" },
	IndentBlanklineContextStart = { sp = p.bg1, gui = "underline" },
	IndentBlanklineContextSpaceChar = { gui = "nocombine" },
}

hl.plugins.mini = {
	MiniCompletionActiveParameter = { fmt = "underline" },

	MiniCursorword = { fmt = "underline" },
	MiniCursorwordCurrent = { fmt = "underline" },

	MiniIndentscopeSymbol = { fg = p.grey },
	MiniIndentscopePrefix = { fmt = "nocombine" }, -- Make it invisible

	MiniJump = { fg = p.purple, fmt = "underline", sp = p.purple },

	MiniJump2dSpot = { fg = p.red, fmt = "bold,nocombine" },

	MiniStarterCurrent = { fmt = "nocombine" },
	MiniStarterFooter = { fg = p.dark_red, fmt = "italic" },
	MiniStarterHeader = p.Yellow,
	MiniStarterInactive = { fg = p.grey, fmt = c.code_style.comments },
	MiniStarterItem = { fg = p.fg, bg = c.transparent and p.none or p.bg0 },
	MiniStarterItemBullet = { fg = p.grey },
	MiniStarterItemPrefix = { fg = p.yellow },
	MiniStarterSection = p.LightGrey,
	MiniStarterQuery = { fg = p.cyan },

	MiniStatuslineDevinfo = { fg = p.fg, bg = p.bg2 },
	MiniStatuslineFileinfo = { fg = p.fg, bg = p.bg2 },
	MiniStatuslineFilename = { fg = p.grey, bg = p.bg1 },
	MiniStatuslineInactive = { fg = p.grey, bg = p.bg0 },
	MiniStatuslineModeCommand = { fg = p.bg0, bg = p.yellow, fmt = "bold" },
	MiniStatuslineModeInsert = { fg = p.bg0, bg = p.blue, fmt = "bold" },
	MiniStatuslineModeNormal = { fg = p.bg0, bg = p.green, fmt = "bold" },
	MiniStatuslineModeOther = { fg = p.bg0, bg = p.cyan, fmt = "bold" },
	MiniStatuslineModeReplace = { fg = p.bg0, bg = p.red, fmt = "bold" },
	MiniStatuslineModeVisual = { fg = p.bg0, bg = p.purple, fmt = "bold" },

	MiniSurround = { fg = p.bg0, bg = p.orange },

	MiniTablineCurrent = { fmt = "bold" },
	MiniTablineFill = { fg = p.grey, bg = p.bg1 },
	MiniTablineHidden = { fg = p.fg, bg = p.bg1 },
	MiniTablineModifiedCurrent = { fg = p.orange, fmt = "bold,italic" },
	MiniTablineModifiedHidden = {
		fg = p.light_grey,
		bg = p.bg1,
		fmt = "italic",
	},
	MiniTablineModifiedVisible = { fg = p.yellow, bg = p.bg0, fmt = "italic" },
	MiniTablineTabpagesection = { fg = p.bg0, bg = p.bg_yellow },
	MiniTablineVisible = { fg = p.light_grey, bg = p.bg0 },

	MiniTestEmphasis = { fmt = "bold" },
	MiniTestFail = { fg = p.red, fmt = "bold" },
	MiniTestPass = { fg = p.green, fmt = "bold" },

	MiniTrailspace = { bg = p.red },
}

hl.filetypes.c = {
	cInclude = p.Blue,
	cStorageClass = p.Purple,
	cTypedef = p.Purple,
	cDefine = p.Cyan,
	cTSInclude = p.Blue,
	cTSConstant = p.Cyan,
	cTSConstMacro = p.Purple,
	cTSOperator = p.Purple,
}

hl.filetypes.cpp = {
	cppStatement = { fg = p.purple, fmt = "bold" },
	cppTSInclude = p.Blue,
	cppTSConstant = p.Cyan,
	cppTSConstMacro = p.Purple,
	cppTSOperator = p.Purple,
}

hl.filetypes.markdown = {
	markdownBlockquote = p.Grey,
	markdownBold = { fg = p.none, fmt = "bold" },
	markdownBoldDelimiter = p.Grey,
	markdownCode = p.Green,
	markdownCodeBlock = p.Green,
	markdownCodeDelimiter = p.Yellow,
	markdownH1 = { fg = p.red, fmt = "bold" },
	markdownH2 = { fg = p.purple, fmt = "bold" },
	markdownH3 = { fg = p.orange, fmt = "bold" },
	markdownH4 = { fg = p.red, fmt = "bold" },
	markdownH5 = { fg = p.purple, fmt = "bold" },
	markdownH6 = { fg = p.orange, fmt = "bold" },
	markdownHeadingDelimiter = p.Grey,
	markdownHeadingRule = p.Grey,
	markdownId = p.Yellow,
	markdownIdDeclaration = p.Red,
	markdownItalic = { fg = p.none, fmt = "italic" },
	markdownItalicDelimiter = { fg = p.grey, fmt = "italic" },
	markdownLinkDelimiter = p.Grey,
	markdownLinkText = p.Red,
	markdownLinkTextDelimiter = p.Grey,
	markdownListMarker = p.Red,
	markdownOrderedListMarker = p.Red,
	markdownRule = p.Purple,
	markdownUrl = { fg = p.blue, fmt = "underline" },
	markdownUrlDelimiter = p.Grey,
	markdownUrlTitleDelimiter = p.Green,
}

hl.filetypes.php = {
	phpFunctions = { fg = p.fg, fmt = c.code_style.functions },
	phpMethods = p.Cyan,
	phpStructure = p.Purple,
	phpOperator = p.Purple,
	phpMemberSelector = p.Fg,
	phpVarSelector = { fg = p.orange, fmt = c.code_style.variables },
	phpIdentifier = { fg = p.orange, fmt = c.code_style.variables },
	phpBoolean = p.Cyan,
	phpNumber = p.Orange,
	phpHereDoc = p.Green,
	phpNowDoc = p.Green,
	phpSCKeyword = { fg = p.purple, fmt = c.code_style.keywords },
	phpFCKeyword = { fg = p.purple, fmt = c.code_style.keywords },
	phpRegion = p.Blue,
}

hl.filetypes.scala = {
	scalaNameDefinition = p.Fg,
	scalaInterpolationBoundary = p.Purple,
	scalaInterpolation = p.Purple,
	scalaTypeOperator = p.Red,
	scalaOperator = p.Red,
	scalaKeywordModifier = { fg = p.red, fmt = c.code_style.keywords },
}

hl.filetypes.tex = {
	latexTSInclude = p.Blue,
	latexTSFuncMacro = { fg = p.fg, fmt = c.code_style.functions },
	latexTSEnvironment = { fg = p.cyan, fmt = "bold" },
	latexTSEnvironmentName = p.Yellow,
	texCmdEnv = p.Cyan,
	texEnvArgName = p.Yellow,
	latexTSTitle = p.Green,
	latexTSType = p.Blue,
	latexTSMath = p.Orange,
	texMathZoneX = p.Orange,
	texMathZoneXX = p.Orange,
	texMathDelimZone = p.LightGrey,
	texMathDelim = p.Purple,
	texMathOper = p.Red,
	texCmd = p.Purple,
	texCmdPart = p.Blue,
	texCmdPackage = p.Blue,
	texPgfType = p.Yellow,
}

hl.filetypes.vim = {
	vimOption = p.Red,
	vimSetEqual = p.Yellow,
	vimMap = p.Purple,
	vimMapModKey = p.Orange,
	vimNotation = p.Red,
	vimMapLhs = p.Fg,
	vimMapRhs = p.Blue,
	vimVar = { fg = p.fg, fmt = c.code_style.variables },
	vimCommentTitle = { fg = p.light_grey, fmt = c.code_style.comments },
}

local lsp_kind_icons_color = {
	Default = p.purple,
	Array = p.yellow,
	Boolean = p.orange,
	Class = p.yellow,
	Color = p.green,
	Constant = p.orange,
	Constructor = p.blue,
	Enum = p.purple,
	EnumMember = p.yellow,
	Event = p.yellow,
	Field = p.purple,
	File = p.blue,
	Folder = p.orange,
	Function = p.blue,
	Interface = p.green,
	Key = p.cyan,
	Keyword = p.cyan,
	Method = p.blue,
	Module = p.orange,
	Namespace = p.red,
	Null = p.grey,
	Number = p.orange,
	Object = p.red,
	Operator = p.red,
	Package = p.yellow,
	Property = p.cyan,
	Reference = p.orange,
	Snippet = p.red,
	String = p.green,
	Struct = p.purple,
	Text = p.light_grey,
	TypeParameter = p.red,
	Unit = p.green,
	Value = p.orange,
	Variable = p.purple,
}

function highlights.setup()
	for kind, color in pairs(lsp_kind_icons_color) do
		hl.plugins.cmp["CmpItemKind" .. kind] = { fg = color }
		hl.plugins.outline["Aerial" .. kind .. "Icon"] = { fg = color }
		hl.plugins.navic["NavicIcons" .. kind] = { fg = color }
	end

	vim_highlights(hl.common)
	vim_highlights(hl.syntax)
	vim_highlights(hl.treesitter)

	for _, group in pairs(hl.filetypes) do
		vim_highlights(group)
	end
	for _, group in pairs(hl.plugins) do
		vim_highlights(group)
	end

	-- user defined highlights: vim_highlights function cannot be used because it sets an attribute to none if not specified
	local function replace_color(prefix, color_name)
		if not color_name then
			return ""
		end
		if color_name:sub(1, 1) == "$" then
			local name = color_name:sub(2, -1)
			color_name = c[name]
			if not color_name then
				vim.schedule(function()
					vim.notify(
						'vagari.nvim: unknown color "' .. name .. '"',
						vim.log.levels.ERROR,
						{ title = "vagari.nvim" }
					)
				end)
				return ""
			end
		end
		return prefix .. "=" .. color_name
	end

	for group_name, group_settings in pairs(vim.g.onedark_config.highlights) do
		vim.api.nvim_command(
			string.format(
				"highlight %s %s %s %s %s",
				group_name,
				replace_color("guifg", group_settings.fg),
				replace_color("guibg", group_settings.bg),
				replace_color("guisp", group_settings.sp),
				replace_color("gui", group_settings.fmt)
			)
		)
	end
end

return highlights
