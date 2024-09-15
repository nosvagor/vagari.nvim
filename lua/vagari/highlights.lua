-- ============================================================================
-- 🧰 setup {{{
local t = require("vagari.thalamus")

local highlights = {}

local hl = {
	syntax = {},
	builtin = {},
	treesitter = {},
	treesitter_queries = {},
	plugins = {},
}

local function nvim_highlight(hl_groups)
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
	nvim_highlight(hl.builtin)
	nvim_highlight(hl.syntax)
	nvim_highlight(hl.treesitter)
	nvim_highlight(hl.treesitter_queries)

	for _, group in pairs(hl.plugins) do
		nvim_highlight(group)
	end
end

-- Useful resources:
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md
-- :so $VIMRUNTIME/syntax/hitest.vim
-- :telescope highlights
-- :h highlight
-- :h group-name

-- }}}
-- ============================================================================

-- 🕹️ builtin {{{
hl.builtin = {
	-- base:
	Normal = t.txt.norm,
	Cursor = t.txt.reverse,
	lCursor = t.txt.reverse,
	CursorIM = t.txt.reverse,
	TermCursor = t.txt.reverse,
	TermCursorNC = t.txt.reverse,
	MatchParen = t.active.norm,
	EndOfBuffer = t.passive.invis,
	Whitespace = t.passive.comment,

	-- recurring ui:
	Folded = t.passive.norm,
	FoldColumn = t.passive.norm,
	CursorLineFold = t.idle.passive,
	SignColumn = t.passive.comment,
	CursorLineSign = t.passive.norm,
	LineNrAbove = t.passive.comment,
	LineNr = t.idle.bold,
	CursorLineNr = t.idle.passive,
	LineNrBelow = t.passive.comment,
	ColorColumn = t.passive.bg,
	CursorColumn = t.passive.bg,
	CursorLine = t.passive.bg,

	-- temporary ui:
	Pmenu = t.idle.passive_br,
	PmenuSel = t.active.select,
	PmenuSbar = t.idle.bg,
	PmenuThumb = t.idle.solid,
	WildMenu = t.active.select,

	-- state change:
	DiffAdd = t.state.new,
	DiffNew = t.state.new,
	DiffChange = t.state.modified,
	DiffText = t.state.modified,
	DiffDelete = t.state.delete,

	-- visual:
	Visual = t.active.visual,
	VisualNOS = t.passive.disown,
	Search = t.idle.search,
	CurSearch = t.active.search,
	IncSearch = t.active.search,
	Substitute = t.active.search,

	-- linting:
	SpellBad = t.msg.error.under,
	SpellCap = t.msg.hint.under,
	SpellLocal = t.msg.info.custom,
	SpellRare = t.msg.info.rare,

	-- messaging:
	ErrorMsg = t.msg.error.norm,
	WarningMsg = t.msg.warn.norm,
	ModeMsg = t.idle.passive_br,
	MsgArea = t.passive.fg,
	MoreMsg = t.idle.norm,
	MsgSeparator = t.idle.norm,
	Question = t.idle.norm,

	-- windows 'n such:
	WinSeparator = t.idle.passive,
	NormalFloat = t.idle.passive_br,
	NormalNC = t.passive.norm,
	QuickFixLine = t.idle.passive_br,
	StatusLine = t.passive.norm,
	StatusLineNC = t.passive.norm,
	TabLine = t.passive.norm,
	TabLineFill = t.passive.bg,
	TabLineSel = t.idle.passive_br,
	WinBar = t.idle.passive,
	WinBarNC = t.passive.norm,

	-- uncertain assignments:
	Directory = t.h1,
	Title = t.h1,
	Conceal = t.idle.norm,
	NonText = t.passive.fg,
	SpecialKey = t.txt.inactive,
}

-- }}}

-- 🏗️ syntax {{{
hl.syntax = {
	Comment = t.passive.comment,
	Constant = t.const.norm,
	String = t.str.norm,
	Character = t.str.char,
	Number = t.num,
	Boolean = t.bool,
	Float = t.float,
	Identifier = t.var.norm,
	Function = t.func.norm,
	Statement = t.keyword.norm,
	Conditional = t.keyword.logic,
	Repeat = t.keyword.logic,
	Label = t.keyword.label,
	Operator = t.operator,
	Keyword = t.keyword.norm,
	Exception = t.keyword.label,
	PreProc = t.keyword.external,
	Include = t.keyword.external,
	Define = t.keyword.externaldef,
	PreCondit = t.keyword.external,
	Macro = t.func.macro,
	Type = t.type.norm,
	StorageClass = t.type.store,
	Structure = t.type.struct,
	Typedef = t.type.def,
	Special = t.special,
	SpecialChar = t.specialchar,
	Title = t.h1,
	Tag = t.var.tag,
	Delimiter = t.delim.norm,
	SpecialComment = t.msg.hint.special,
	Debug = t.msg.hint.special,
	Ignore = t.passive.fg,
	Error = t.msg.error.norm,
	Todo = t.msg.hint.special,

	Bold = t.txt.bold,
	Italic = t.txt.italic,
	Underlined = t.txt.underline,

	healthError = t.msg.error.inverse,
	healthSuccess = t.msg.success.inverse,
	healthWarning = t.msg.warn.alt,

	markdownHeadingRule = t.passive.comment,
}

-- }}}

-- 🎄 treesitter {{{
hl.treesitter =
	{ -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md

		-- Misc
		["@comment"] = t.passive.comment, -- line and block comments
		["@comment.documentation"] = t.passive.bg, -- comments documenting code
		["@error"] = t.msg.error.norm, -- syntax/parser errors
		["@none"] = t.txt.norm, -- completely disable the highlight
		["@preproc"] = t.keyword.external, -- various preprocessor directives & shebangs
		["@define"] = t.keyword.external, -- preprocessor definition directives
		["@operator"] = t.operator, -- symbolic operators (e.g. `+` / `*`)

		-- Punctuation
		["@punctuation.delimiter"] = t.delim.norm, --` / `.` / `,`)
		["@punctuation.bracket"] = t.delim.bracket, -- brackets (e.g. `()` / `{}` / `[]`)
		["@punctuation.special"] = t.special, -- special symbols (e.g. `{}` in string interpolation)

		-- Literals
		["@string"] = t.str.norm, -- string literals
		["@string.documentation"] = t.str.doc, -- string documenting code (e.g. Python docstrings)
		["@string.regex"] = t.str.regex, -- regular expressions
		["@string.escape"] = t.str.char, -- escape sequences
		["@string.special"] = t.str.special, -- other special strings (e.g. dates)
		["@character"] = t.str.char, -- character literals
		["@character.special"] = t.str.special, -- special characters (e.g. wildcards)
		["@boolean"] = t.bool, -- boolean literals
		["@number"] = t.num, -- numeric literals
		["@float"] = t.float, -- floating-point number literals

		-- Functions
		["@function"] = t.func.norm, -- function definitions
		["@function.builtin"] = t.func.builtin, -- built-in functions
		["@function.call"] = t.func.norm, -- function calls
		["@function.macro"] = t.func.macro, -- preprocessor macros
		["@method"] = t.func.norm, -- method definitions
		["@method.call"] = t.func.norm, -- method calls
		["@constructor"] = t.typedef, -- constructor calls and definitions
		["@parameter"] = t.var.param, -- parameters of a function

		-- Keywords
		["@keyword"] = t.keyword.norm, -- various keywords
		["@keyword.coroutine"] = t.keyword.def, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
		["@keyword.function"] = t.keyword.def, -- keywords that define a function (e.g. `func` in Go, `def` in Python)
		["@keyword.operator"] = t.keyword.logic, -- operators that are English words (e.g. `and` / `or`)
		["@keyword.return"] = t.keyword.flow, -- keywords like `return` and `yield`
		["@conditional"] = t.keyword.logic, -- keywords related to conditionals (e.g. `if` / `else`)
		["@conditional.ternary"] = t.keyword.flow, -- ternary operator (e.g. `?` / `:`)
		["@repeat"] = t.keyword.logic, -- keywords related to loops (e.g. `for` / `while`)
		["@debug"] = t.msg.hint.special, -- keywords related to debugging
		["@label"] = t.keyword.label, -- GOTO and other labels (e.g. `label:` in C)
		["@include"] = t.keyword.external, -- keywords for including modules (e.g. `import` / `from` in Python)
		["@exception"] = t.keyword.exception, -- keywords related to exceptions (e.g. `throw` / `catch`)

		-- Types
		["@type"] = t.type.norm, -- type or class definitions and annotations
		["@type.builtin"] = t.type.builtin, -- built-in types
		["@type.definition"] = t.type.def, -- type definitions (e.g. `typedef` in C)
		["@type.qualifier"] = t.type.struct, -- type qualifiers (e.g. `const`)
		["@storageclass"] = t.type.store, -- modifiers that affect storage in memory or life-time
		["@attribute"] = t.keyword.external, -- attribute annotations (e.g. Python decorators)
		["@field"] = t.var.norm, -- object and struct fields
		["@property"] = t.var.norm, -- similar to `@field`

		-- Identifiers
		["@variable"] = t.var.norm, -- various variable names
		["@variable.builtin"] = t.var.builtin, -- built-in variable names (e.g. `this`)
		["@constant"] = t.const.norm, -- constant identifiers
		["@constant.builtin"] = t.const.builtin, -- built-in constant values
		["@constant.macro"] = t.const.external, -- constants defined by the preprocessor
		["@namespace"] = t.var.builtin, -- modules or namespaces
		["@symbol"] = t.var.builtin, -- symbols or atoms

		-- Text
		["@text"] = t.txt.norm, -- non-structured text
		["@text.strong"] = t.txt.bold, -- bold text
		["@text.emphasis"] = t.txt.italic, -- text with emphasis
		["@text.underline"] = t.txt.underline, -- underlined text
		["@text.strike"] = t.txt.strike, -- strikethrough text
		["@text.title"] = t.txt.title, -- text that is part of a title
		["@text.literal"] = t.str.norm, -- literal or verbatim text (e.g., inline code)
		["@text.quote"] = t.txt.minor, -- text quotations
		["@text.uri"] = t.link, -- URIs (e.g. hyperlinks)
		["@text.math"] = t.msg.hint.special, -- math environments (e.g. `$ ... $` in LaTeX)
		["@text.environment"] = t.type.norm, -- text environments of markup languages
		["@text.environment.name"] = t.type.def, -- text indicating the type of an environment
		["@text.reference"] = t.passive.comment, -- text references, footnotes, citations, etc.
		["@text.todo"] = t.msg.hint.special, -- todo notes
		["@text.note"] = t.msg.info.norm, -- info notes
		["@text.warning"] = t.warning, -- warning notes
		["@text.danger"] = t.msg.error.norm, -- danger/error notes
		["@text.diff.add"] = t.state.new, -- added text (for diff files)
		["@text.diff.delete"] = t.state.delete, -- deleted text (for diff files)

		-- Tags
		["@tag"] = t.var.tag, -- XML tag names
		["@tag.attribute"] = t.var.attr, -- XML tag attributes
		["@tag.delimiter"] = t.delim.norm, -- XML tag delimiters

		--LSP
		["@lsp.type.comment"] = hl.treesitter["@comment"],
		["@lsp.type.enum"] = hl.treesitter["@type"],
		["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
		["@lsp.type.interface"] = hl.treesitter["@type"],
		["@lsp.type.typeParameter"] = hl.treesitter["@type"],
		["@lsp.type.keyword"] = hl.treesitter["@keyword"],
		["@lsp.type.namespace"] = hl.treesitter["@namespace"],
		["@lsp.type.parameter"] = hl.treesitter["@parameter"],
		["@lsp.type.property"] = hl.treesitter["@property"],
		["@lsp.type.variable"] = hl.treesitter["@variable"],
		["@lsp.type.macro"] = hl.treesitter["@function.macro"],
		["@lsp.type.method"] = hl.treesitter["@method"],
		["@lsp.type.number"] = hl.treesitter["@number"],
		["@lsp.type.generic"] = hl.treesitter["@text"],
		["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
		["@lsp.typemod.method.defaultLibrary"] = hl.treesitter["@function"],
		["@lsp.typemod.function.defaultLibrary"] = hl.treesitter["@function"],
		["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
		["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
		["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@variable.builtin"],
		["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
	}
-- }}}

-- 🚏 treesitter queries {{{
hl.treesitter_queries =
	{ -- https://github.com/nvim-treesitter/nvim-treesitter/tree/master/queries

		--help
		["@label.help"] = t.var.tag,
		["@text.reference"] = t.link,
		["@text.literal"] = t.passive.fg,

		-- toml
		["@type.toml"] = t.var.tag,
		["@property.toml"] = t.var.param,
	}
-- }}}

-- 🔌 plugins {{{

hl.plugins.lsp = {
	DiagnosticError = t.msg.error.norm,
	DiagnosticHint = t.msg.hint.norm,
	DiagnosticInfo = t.msg.info.norm,
	DiagnosticWarn = t.msg.warn.norm,

	DiagnosticVirtualTextError = t.msg.error.virtual,
	DiagnosticVirtualTextWarn = t.msg.warn.virtual,
	DiagnosticVirtualTextInfo = t.msg.info.virtual,
	DiagnosticVirtualTextHint = t.msg.hint.virtual,

	DiagnosticUnderlineError = t.msg.error.under,
	DiagnosticUnderlineHint = t.msg.hint.under,
	DiagnosticUnderlineInfo = t.msg.info.under,
	DiagnosticUnderlineWarn = t.msg.warn.under,

	LspReferenceText = t.txt.bold,
	LspReferenceWrite = t.active.search,
	LspReferenceRead = t.idle.ref,
}

hl.plugins.gitsigns = {
	GitSignsAdd = t.state.new,
	GitSignsAddLn = t.state.new,
	GitSignsAddNr = t.state.new,
	GitSignsChange = t.state.modified,
	GitSignsChangeLn = t.state.modified,
	GitSignsChangeNr = t.state.modified,
	GitSignsDelete = t.state.delete,
	GitSignsDeleteLn = t.state.delete,
	GitSignsDeleteNr = t.state.delete,
}

hl.plugins.nvim_tree = {
	NvimTreeNormal = t.idle.passive_br,
	NvimTreeEndOfBuffer = t.idle.invis_br,
	NvimTreeRootFolder = t.txt.title,
	NvimTreeGitDirty = t.state.modified,
	NvimTreeGitNew = t.state.new,
	NvimTreeGitDeleted = t.state.delete,
	NvimTreeSpecialFile = t.special,
	NvimTreeFolderName = t.var.tag,
}

hl.plugins.telescope = {
	TelescopeNormal = t.idle.passive_br,
	TelescopeBorder = t.idle.passive_br,
	TelescopeTitle = t.idle.bold,
	TelescopePromptNormal = t.active.input,
	TelescopePromptBorder = t.active.input,
	TelescopePromptTitle = t.active.input,
	TelescopeMatching = t.active.search,
	TelescopePromptPrefix = t.active.norm,
	TelescopeSelection = t.active.select,
	TelescopeSelectionCaret = t.active.select,
}

-- }}}

return highlights
