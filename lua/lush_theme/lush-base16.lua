local colors = require("lush_theme.colors")

local theme = require("lush")(function(injected_functions)
	local sym = injected_functions.sym

	return {
		Normal { bg = "none" },                              -- Normal text
		NormalNC { bg = "none" },                            -- normal text in non-current windows
		NormalFloat { bg = colors.black },                   -- Normal text in floating windows.
		Comment { fg = colors.black.lighten(33), gui = "italic" }, -- Any comment
		FloatBorder { fg = NormalFloat.bg.lighten(45), bg = "none" },
		FloatSel { bg = NormalFloat.bg.lighten(20), fg = "none" },
		-- Conceal                      { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		-- Cursor                       { }, -- Character under the cursor
		-- lCursor                      { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM                     { }, -- Like Cursor, but used when in IME mode |CursorIM|
		CursorLine { bg = colors.black.lighten(12) },                       -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		CursorColumn { CursorLine },                                        -- Screen-column at the cursor, when 'cursorcolumn' is set.
		Directory { fg = colors.white },                                    -- Directory names (and other special names in listings)
		DiffAdd { fg = colors.green.lighten(25), bg = colors.green.darken(75) }, -- Diff mode: Added line |diff.txt|
		diffAdded { fg = colors.green },
		DiffChange { fg = colors.blue.lighten(25), bg = colors.blue.darken(75) }, -- Diff mode: Changed line |diff.txt|
		diffChanged { fg = colors.blue },
		DiffDelete { fg = colors.red.lighten(25), bg = colors.red.darken(75) }, -- Diff mode: Deleted line |diff.txt|
		diffDelete { fg = colors.red },
		diffRemoved { fg = colors.red },
		DiffText { fg = colors.blue.lighten(50), bg = DiffChange.bg, gui = "bold" }, -- Diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer { Normal },                                                -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		-- TermCursor                   { }, -- Cursor in a focused terminal
		-- TermCursorNC                 { }, -- Cursor in an unfocused terminal
		ErrorMsg { fg = colors.red },                                     -- Error messages on the command line
		Folded {},                                                        -- Line used for closed folds
		IncSearch { fg = colors.black, bg = colors.yellow, gui = "bold" }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Search { bg = colors.black.lighten(10), gui = "underline" },      -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		Substitute { bg = colors.orange, fg = colors.black },             -- |:substitute| replacement text highlighting
		LineNr { fg = colors.black.lighten(30), bg = colors.black.lighten(6) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		ColorColumn { fg = colors.black.lighten(10) },                    -- Columns set with 'colorcolumn'
		VertSplit { bg = LineNr.bg, fg = colors.black.lighten(20) },      -- Column separating vertically split windows
		SignColumn { LineNr },                                            -- Column where |signs| are displayed
		FoldColumn { SignColumn, fg = SignColumn.fg.lighten(25) },        -- 'foldcolumn'
		CursorLineNr { fg = colors.orange, bg = LineNr.bg, gui = "bold" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen { bg = CursorLine.bg.lighten(12) },                    -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg                      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea                      { }, -- Area for messages and cmdline
		-- MsgSeparator                 { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg { fg = colors.green, gui = "bold,italic" }, -- |more-prompt|
		NonText { fg = colors.black.lighten(15) },         -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Pmenu { fg = "none", bg = colors.black.lighten(30) }, -- Popup menu: Normal item.
		PmenuSel { bg = Pmenu.bg.lighten(10) },            -- Popup menu: Selected item.
		PmenuSbar { bg = Pmenu.bg.darken(30) },            -- Popup menu: Scrollbar.
		PmenuThumb { bg = Pmenu.bg.lighten(70) },          -- Popup menu: Thumb of the scrollbar.
		DocMenu { bg = Pmenu.bg },
		Question { fg = colors.green, gui = "bold,italic" }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine { bg = colors.black.lighten(30) },    -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		SpecialKey { fg = colors.orange },                 -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad { sp = colors.red, gui = "undercurl" },   -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap { sp = colors.blue, gui = "undercurl" },  -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal { sp = colors.cyan, gui = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare { sp = colors.purple, gui = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine { bg = colors.black.lighten(10) },      -- Status line of current window
		StatusLineNC { bg = colors.black.lighten(10) },    -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		Title { fg = colors.blue },                        -- Titles for output from ":set all", ":autocmd" etc.
		Visual { bg = colors.purple.darken(50).desaturate(35) }, -- Visual mode selection
		-- VisualNOS                    { }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg { fg = colors.yellow },                 -- Warning messages
		Whitespace { fg = colors.red, bg = colors.red },   -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WinSeparator { fg = VertSplit.bg.lighten(10), bg = VertSplit.bg },
		WildMenu { Pmenu },                                -- Current match in 'wildmenu' completion
		Yank { bg = colors.yellow, fg = colors.black },

		Constant { fg = colors.red, gui = "bold" }, -- (*) Any constant
		String { fg = colors.green },               --   A string constant: "this is a string"
		Character { fg = colors.red },              --   A character constant: 'c', '\n'
		Number { fg = colors.orange },              --   A number constant: 234, 0xff
		Boolean { fg = colors.orange },             --   A boolean constant: TRUE, false
		Float { fg = colors.orange },               --   A floating point constant: 2.3e10

		Identifier { fg = colors.purple },          -- (*) Any variable name
		Function { fg = colors.blue },              --   Function name (also: methods for classes)

		Statement { fg = colors.purple, gui = "italic" }, -- (*) Any statement
		Keyword { Statement },                      --   any other keyword
		Operator { fg = colors.purple },            --   "sizeof", "+", "*", etc.
		-- Conditional                  { }, --   if, then, else, endif, switch, etc.
		Repeat { fg = colors.yellow, gui = "italic" }, --   for, do, while, etc.
		-- Label                        { }, --   case, default, etc.
		Exception { fg = colors.red, gui = "italic" }, --   try, catch, throw

		PreProc { fg = colors.blue, gui = "italic" }, -- (*) Generic Preprocessor
		-- Include                      { }, --   Preprocessor #include
		-- Define                       { }, --   Preprocessor #define
		-- Macro                        { }, --   Same as Define
		-- PreCondit                    { }, --   Preprocessor #if, #else, #endif, etc.

		Type { fg = colors.yellow }, -- (*) int, long, char, etc.
		-- StorageClass                 { }, --   static, register, volatile, etc.
		-- Structure                    { }, --   struct, union, enum, etc.
		-- Typedef                      { }, --   A typedef

		Special { fg = colors.orange }, -- (*) Any special symbol
		-- SpecialChar                  { }, --   Special character in a constant
		-- Tag                          { }, --   You can use CTRL-] on this
		-- Delimiter                    { }, --   Character that needs attention
		-- SpecialComment               { }, --   Special things inside a comment (e.g. '\n')
		-- Debug                        { }, --   Debugging statements

		Underlined { fg = "none", gui = "underline" },             -- Text that stands out, HTML links
		Ignore { Comment },                                        -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error { fg = colors.red, gui = "bold" },                   -- Any erroneous construct
		Todo { fg = colors.black, bg = colors.cyan, gui = "bold" }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		ConstBuiltin { fg = colors.red.darken(5), gui = "italic,bold" }, -- Built-in constant values: `nil` in Lua.
		ConstMacro { Constant },                                   -- Constants defined by macros: `NULL` in C.
		Field { fg = colors.red },                                 -- Object and struct fields.
		Property { Field },                                        -- Same as `Field`.
		FuncBuiltin { fg = colors.cyan, gui = "italic" },          -- Built-in functions: `print` in Lua.
		Method { Function },                                       -- Method calls and definitions.
		Include {},                                                -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
		Keyword { Keyword },                                       -- Keywords that don't fit into other categories.
		KeywordFunction { Keyword, gui = "none" },                 -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
		KeywordReturn { Keyword, gui = "italic" },                 -- Keywords like `return` and `yield`.
		Label { fg = colors.yellow },                              -- GOTO labels: `label:` in C, and `::label::` in Lua.
		None { fg = colors.white },                                -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
		Variable { fg = colors.white },                            -- Variable names that don't fit into other categories.
		Parameter { fg = colors.orange, gui = "italic" },          -- Parameters of a function.
		VariableBuiltin { fg = colors.yellow, gui = "italic" },    -- Variable names defined by the language: `this` or `self` in Javascript.
		Strong { gui = "bold" },                                   -- Text to be represented in bold.
		Emphasis { Strong },                                       -- Text to be represented with emphasis.
		Underline { gui = "underline" },                           -- Text to be represented with an underline.
		Strike { gui = "strikethrough" },                          -- Strikethrough text.
		URI { gui = "none" },                                      -- URIs like hyperlinks or email addresses.
		TextReference { fg = colors.red },                         -- Footnotes, text references, citations, etc.
		Warning { WarningMsg },                                    -- Text representation of a warning note.
		Danger { Error },                                          -- Text representation of a danger note.
		TypeBuiltin { Type, gui = "italic" },                      -- Built-in types: `i32` in Rust.
		TypeDefinition { Type },
		Constructor { Type },

		LspReferenceText {},        -- Used for highlighting "text" references
		LspReferenceWrite { CursorLine }, -- Used for highlighting "write" references
		LspReferenceRead { CursorLine }, -- Used for highlighting "read" references
		-- LspCodeLens                  { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator         { } , -- Used to color the separator between two or more code lens.
		-- LspSignatureActiveParameter  { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		DiagnosticError { fg = colors.red },                                                                  -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn { fg = colors.yellow },                                                                -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo { fg = colors.blue },                                                                  -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint { fg = colors.white },                                                                 -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticVirtualTextError { fg = DiagnosticError.fg, bg = DiagnosticError.fg.darken(70), gui = "italic" }, -- Used for "Error" diagnostic virtual text.
		DiagnosticVirtualTextWarn { fg = DiagnosticWarn.fg, bg = DiagnosticWarn.fg.darken(70), gui = "italic" }, -- Used for "Warn" diagnostic virtual text.
		DiagnosticVirtualTextInfo { fg = DiagnosticInfo.fg, bg = DiagnosticInfo.fg.darken(70), gui = "italic" }, -- Used for "Info" diagnostic virtual text.
		DiagnosticVirtualTextHint { fg = DiagnosticHint.fg, bg = DiagnosticHint.fg.darken(70), gui = "italic" }, -- Used for "Hint" diagnostic virtual text.
		DiagnosticUnderlineError { sp = DiagnosticError.fg, gui = "undercurl" },                              -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn { sp = DiagnosticWarn.fg, gui = "undercurl" },                                -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo { sp = DiagnosticInfo.fg, gui = "undercurl" },                                -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint { sp = DiagnosticHint.fg, gui = "undercurl" },                                -- Used to underline "Hint" diagnostics.
		-- DiagnosticFloatingError      { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn       { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo       { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint       { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		DiagnosticSignError { DiagnosticError, bg = LineNr.bg }, -- Used for "Error" signs in sign column.
		DiagnosticSignWarn { DiagnosticWarn, bg = LineNr.bg }, -- Used for "Warn" signs in sign column.
		DiagnosticSignInfo { DiagnosticInfo, bg = LineNr.bg }, -- Used for "Info" signs in sign column.
		DiagnosticSignHint { DiagnosticHint, bg = LineNr.bg }, -- Used for "Hint" signs in sign column.

		BufferCurrent { fg = colors.white, bg = colors.black.lighten(20) },
		BufferCurrentIcon { bg = BufferCurrent.bg },
		BufferCurrentMod { fg = colors.red, bg = BufferCurrent.bg, gui = "italic" },
		BufferCurrentSign { fg = colors.blue, bg = BufferCurrent.bg },
		BufferCurrentTarget { fg = colors.purple, bg = BufferCurrent.bg, gui = "bold" },
		BufferVisible { fg = BufferCurrent.fg.darken(35), bg = colors.black },
		BufferVisibleMod { BufferCurrentMod, bg = BufferVisible.bg },
		BufferVisibleIcon { bg = BufferVisible.bg },
		BufferVisibleSign { fg = colors.white.darken(50), bg = BufferVisible.bg },
		BufferVisibleTarget { fg = colors.purple, bg = BufferVisible.bg, gui = "bold" },
		BufferInactive { fg = BufferVisible.fg.darken(50), bg = colors.black },
		BufferInactiveMod { BufferCurrentMod, bg = BufferInactive.bg },
		BufferInactiveIcon { bg = BufferInactive.bg },
		BufferInactiveSign { fg = BufferInactive.fg, bg = BufferInactive.bg },
		BufferInactiveTarget { fg = colors.purple, bg = BufferInactive.bg, gui = "bold" },
		BufferTabpageFill { bg = colors.black, fg = colors.white.darken(50) },
		BufferBg { bg = colors.black },

		TablineHead { fg = colors.purple, bg = colors.black.lighten(15) },
		TabLine { fg = colors.white, bg = colors.black.lighten(15) },
		TablineFill { fg = colors.black.lighten(15), bg = colors.black },
		TablineWin { fg = colors.white.darken(25), bg = colors.black.lighten(15) },
		TablineSel { fg = colors.white, bg = colors.black.lighten(15) },
		TablineSep { fg = colors.black, bg = colors.black.lighten(15) },
		TablineTail { fg = colors.green, bg = colors.black.lighten(15) },
		BufferModified { fg = colors.red, bg = colors.black.lighten(15) },

		IblIndent { fg = VertSplit.bg.lighten(10) },
		IblScope { fg = colors.purple.darken(25).desaturate(50) },
		TreeIndentMarker { IblIndent },

		MarkSignHL { fg = colors.red, bg = LineNr.bg, gui = "bold" },
		MarkSignNumHL { CursorLineNr },

		CmpGhostText { fg = Comment.fg.darken(10), gui = "none" },
		CmpItemAbbrMatch { fg = colors.orange, gui = "bold" },
		CmpItemAbbrMatchFuzzy { fg = CmpItemAbbrMatch.fg.desaturate(50) },
		CmpItemAbbrDefault { fg = colors.white.darken(10) },
		CmpItemMenu { fg = Pmenu.bg.lighten(45), gui = "italic" },
		CmpItemKindField { Field, gui = "reverse", bg = colors.black },
		CmpItemKindProperty { Property, gui = "reverse", bg = colors.black },
		CmpItemKindEvent { CmpItemMenu, bg = colors.black },
		CmpItemKindDeprecated { fg = colors.black.lighten(50), gui = "strikethrough,italic", bg = colors.black },
		CmpItemKindText { fg = colors.white, gui = "reverse", bg = colors.black },
		CmpItemKindEnum { Type, gui = "reverse", bg = colors.black },
		CmpItemKindKeyword { Keyword, gui = "reverse", bg = colors.black },
		CmpItemKindConstant { Constant, gui = "reverse", bg = colors.black },
		CmpItemKindConstructor { Constant, gui = "reverse", bg = colors.black },
		CmpItemKindReference { TextReference, gui = "reverse", bg = colors.black },
		CmpItemKindFunction { Function, gui = "reverse", bg = colors.black },
		CmpItemKindStruct { Type, gui = "reverse", bg = colors.black },
		CmpItemKindClass { Type, gui = "reverse", bg = colors.black },
		CmpItemKindModule { PreProc, gui = "reverse", bg = colors.black },
		CmpItemKindOperator { Operator, gui = "reverse", bg = colors.black },
		CmpItemKindVariable { Variable, gui = "reverse", bg = colors.black },
		CmpItemKindFile { CmpItemKindText, bg = colors.black },
		CmpItemKindUnit { CmpItemKindText, bg = colors.black },
		CmpItemKindSnippet { fg = colors.green, gui = "reverse", bg = colors.black },
		CmpItemKindFolder { fg = colors.cyan, gui = "reverse", bg = colors.black },
		CmpItemKindMethod { Method, gui = "reverse", bg = colors.black },
		CmpItemKindValue { Special, gui = "reverse", bg = colors.black },
		CmpItemKindEnumMember { Property, gui = "reverse", bg = colors.black },
		CmpItemKindInterface { Type, gui = "reverse", bg = colors.black },
		CmpItemKindColor { CmpItemKindText, bg = colors.black },
		CmpItemKindTypeParameter { CmpItemKindText, bg = colors.black },
		CmpItemKindCopilot { bg = colors.green, fg = colors.black },
		CmpItemKindTabNine { bg = colors.white, fg = colors.black },
		CmpItemKindTreesitter { bg = colors.green, fg = colors.black },

		TelescopeNormal { fg = colors.white.darken(50), bg = colors.black },
		TelescopeBorder { fg = colors.black.lighten(33), bg = colors.black },
		TelescopeTitle { TelescopeBorder },
		TelescopePreviewNormal { bg = TelescopeNormal.bg },
		TelescopePreviewBorder { TelescopeBorder },
		TelescopePreviewTitle { TelescopeBorder },
		TelescopeMatching { CmpItemAbbrMatch },
		TelescopeResultsTitle { TelescopeMatching },
		TelescopeResultsBorder { TelescopeBorder },
		TelescopePromptNormal { fg = colors.white, bg = colors.black },
		TelescopePromptBorder { TelescopeBorder },
		TelescopePromptTitle { TelescopeNormal },
		TelescopePromptPrefix { fg = colors.orange, bg = TelescopePromptNormal.bg, gui = "bold" },
		TelescopeResultsLineNr { LineNr },
		TelescopeSelection { fg = colors.white, bg = FloatSel.bg },
		TelescopeSelectionCaret { fg = colors.yellow, bg = TelescopeNormal.bg },
		TelescopePreviewLine { CursorLine },
		TelescopeResultsFunction { CmpItemKindFunction },
		TelescopeResultsClass { CmpItemKindFunction },
		TelescopeResultsVariable { CmpItemKindVariable },
		TelescopeResultsConstant { CmpItemKindConstant },
		TelescopeResultsProperty { CmpItemKindProperty },
		TelescopeResultsStruct { Type },

		FidgetTitle { fg = colors.white, bg = WinBar.bg },
		FidgetTask { fg = colors.blue, bg = WinBar.bg },

		CodewindowBackground { bg = "none" },
		CodewindowBoundsBackground { bg = CursorLine.bg },
		CodewindowBorder { fg = colors.black.lighten(15), bg = "none" },
		CodewindowWarning { fg = colors.yellow, bg = "none" },
		CodewindowError { fg = colors.red, bg = "none" },
		CodewindowAddition { fg = colors.green, bg = "none" },
		CodewindowDeletion { fg = colors.red, bg = "none" },
		DevIconDefault { fg = colors.black.lighten(25) },

		NeoTreeNormal { bg = colors.black },
		NeoTreeNormalNC { bg = colors.black },
		TreeExpander { fg = colors.orange },
		TreeModified { fg = BufferCurrentMod.fg },
		NeoTreeDirectoryIcon { Directory },
		NeoTreeRootName { Directory, gui = "bold,italic" },
		NeoTreeFileIcon { DevIconDefault },
		NeoTreeGitUntracked { fg = colors.orange },
		NeoTreeGitConflict { fg = colors.red },
		NeoTreeGitModified { diffChanged },
		NeoTreeGitRenamed { fg = colors.purple },
		NeoTreeGitDeleted { diffDelete },
		NeoTreeGitAdded { diffAdded },
		-- NeoTreeFloatBorder              { NeoTreeNormal, fg = NeoTreeNormal.bg },

		yamlBool { Boolean },
		yamlBlockCollectionItemStart { Special },

		yaraRuleSection { fg = colors.yellow },
		yaraIdentifier { fg = colors.white },

		dockerfileKeyword { Keyword, gui = "none" },

		devIconDockerfile { fg = colors.blue },
		devIconDefault { fg = colors.blue.desaturate(20).darken(10) },

		helpURI { URI },

		rainbowcol1 { fg = colors.red },
		rainbowcol2 { fg = colors.orange },
		rainbowcol3 { fg = colors.yellow },
		rainbowcol4 { fg = colors.green },
		rainbowcol5 { fg = colors.cyan },
		rainbowcol6 { fg = colors.blue },
		rainbowcol7 { fg = colors.purple },

		ScrollbarCursorHandle { fg = colors.white.darken(30) },
		ScrollbarHandle { bg = "none" },
		ScrollbarSearchHandle { ScrollbarHandle, fg = IncSearch.bg }, -- Inside the scrollbar
		ScrollbarSearch { fg = IncSearch.bg.darken(65) },       -- Outside the scrollbr
		ScrollbarErrorHandle { ScrollbarHandle, fg = DiagnosticError.fg },
		ScrollbarError { fg = DiagnosticError.fg.darken(65) },
		ScrollbarWarnHandle { ScrollbarHandle, fg = DiagnosticWarn.fg },
		ScrollbarWarn { fg = DiagnosticWarn.fg.darken(65) },
		ScrollbarInfoHandle { ScrollbarHandle, fg = DiagnosticInfo.fg },
		ScrollbarInfo { fg = DiagnosticInfo.fg.darken(65) },
		ScrollbarHintHandle { ScrollbarHandle, fg = DiagnosticHint.fg },
		ScrollbarHint { fg = DiagnosticHint.fg.darken(65) },
		ScrollbarGitAddHandle { ScrollbarHandle, fg = colors.green },
		ScrollbarGitAdd { fg = colors.green.darken(65), bg = "none" },
		ScrollbarGitChangeHandle { ScrollbarHandle, fg = colors.blue },
		ScrollbarGitChange { fg = colors.blue.darken(65), bg = "none" },
		ScrollbarGitDeleteHandle { ScrollbarHandle, fg = colors.red },
		ScrollbarGitDelete { fg = colors.red.darken(65), bg = "none" },
		ScrollbarMiscHandle { ScrollbarHandle },
		ScrollbarMisc {},

		HlSearchLens { Comment, gui = "none" },

		-- HopCursor                    { },
		HopUnmatched { Comment, gui = "none" },
		-- HopPreview                   { },
		HopNextKey { fg = colors.purple.saturate(25), bg = colors.purple.darken(75), gui = "bold" },
		HopNextKey1 { fg = colors.blue.saturate(25), bg = colors.blue.darken(75), gui = "bold" },
		HopNextKey2 { fg = colors.cyan.saturate(25), bg = colors.cyan.darken(75), gui = "bold" },

		GitSignsAddLn { DiffAdd },
		GitSignsAddInline { GitSignsAddLn, bg = GitSignsAddLn.bg.lighten(10), gui = "bold" },
		-- GitSignsAddLnInline          { bg = colors.yellow },
		GitSignsDeleteLn { DiffDelete },
		GitSignsDeleteInline { GitSignsDeleteLn, bg = GitSignsDeleteLn.bg.lighten(10), gui = "bold" },
		-- GitSignsDeleteLnInline       { GitSignsDeleteLn },
		GitSignsChangeLn { DiffChange },
		GitSignsChangeInline { GitSignsChangeLn, bg = GitSignsChangeLn.bg.lighten(10), gui = "bold" },
		-- GitSignsChangeLnInline       { GitSignsChangeLn },
		GitSignsAdd { diffAdded, bg = LineNr.bg },
		GitSignsChange { diffChanged, bg = LineNr.bg },
		GitSignsChangeDelete { diffChanged, bg = LineNr.bg },
		GitSignsDelete { diffDelete, bg = LineNr.bg },

		WinBar { fg = colors.white.darken(50), bg = colors.black.lighten(14) },
		WinBarNC { bg = WinBar.bg },

		NvimTreeFolderIcon { fg = colors.orange },
		NvimTreeFolderName { fg = colors.white },
		NvimTreeOPENEDFolderName { NvimTreeFolderName },
		NvimTreeRootFolder { fg = colors.purple, gui = "bold", },
		NvimTreeGitDirty { fg = colors.red },
		NvimTreeGitDeleted { fg = colors.red.darken(25), gui = "italic" },
		NvimTreeGitStaged { fg = colors.green },
		NvimTreeGitNew { fg = colors.yellow },
		NvimTreeNormal { bg = colors.black },
		NvimTreeSpecialFile { fg = colors.yellow, gui = "underline,bold" },
		NvimTreeIndentMarker { FoldColumn, bg = "none" },
		NvimTreeImageFile { fg = colors.blue },
		NvimTreeWinSeparator { WinSeparator },

		HlArgs { Parameter },

		UfoMarker { Comment },
		UfoFoldedBg { bg = colors.purple.darken(50) },

		NullLsInfoBorder { FloatBorder },

		CodeActionNumber { fg = colors.orange, gui = "bold" },
		RenameNormal { Normal },

		IlluminatedWordText { CursorLine, gui = "underline" },
		sym("illuminatedWord") { IlluminatedWordText },

		LspInfoBorder { FloatBorder },

		ContextVt { fg = colors.black.lighten(15), gui = "italic" },
		NoiceCmdline { fg = colors.white, bg = colors.yellow.darken(90) },
		SmoothCursor { fg = colors.orange, bg = SignColumn.bg },
		VirtColumn { fg = colors.black.lighten(5) },

		LeapBackdrop { fg = colors.black.lighten(25) },
		LeapMatch { fg = colors.white, gui = "bold" },
		LeapLabelPrimary { fg = colors.purple, bg = colors.purple.darken(60), gui = "bold" },
		LeapLabelSecondary { fg = colors.blue, bg = colors.blue.darken(60), gui = "bold" },

		Cursor { fg = colors.white, gui = "reverse" },

		DapBreakpoint { fg = colors.red, bg = LineNr.bg, gui = "bold" },
		DapStopped { fg = colors.red, bg = LineNr.bg },
		DapUIDecoration { fg = colors.white },
		DapUIStop { DapStopped },
		DapUIBreakpointsPath { fg = colors.blue },
		DapUIBreakpointsLine { fg = colors.orange },
		DapUIWatchesEmpty { fg = colors.red },
		DapUIWatchesValue { fg = colors.green },
		DapUIStoppedThread { fg = colors.purple },
		DapUIThread { fg = colors.green },
		DapUICurrentFrameName { fg = colors.green },
		DapUISource { fg = colors.blue },
		DapUIScope { fg = colors.blue },
		DapUIVariable { fg = colors.white },
		DapUIType { fg = colors.yellow },
		DapUIValue { fg = colors.green },
		DapUIPlayPause { fg = colors.green, bg = LineNr.bg },
		DapUIRestart { fg = colors.green, bg = LineNr.bg },
		DapUIStepOver { fg = colors.blue, bg = LineNr.bg },
		DapUIStepInto { fg = colors.blue, bg = LineNr.bg },
		DapUIStepOut { fg = colors.blue, bg = LineNr.bg },
		DapUIStepBack { fg = colors.blue, bg = LineNr.bg },
		DapUILineNumber { fg = colors.orange },
		DapUINormalNC { bg = LineNr.bg },
		DapUIModifiedValue { fg = colors.red },

		FlashMatch { fg = colors.white.darken(20) },
		FlashCurrent { fg = colors.purple, bg = colors.purple.darken(60), gui = "bold" },
		FlashLabel { fg = colors.blue, bg = colors.blue.darken(60), gui = "bold" },

		Delimiter { Operator },

		TreesitterContext { bg = WinBar.bg, gui = "" },
		TreesitterContextBottom { bg = WinBar.bg, gui = "none", guisp = colors.gray },
		TreesitterContextLineNumberBottom { fg = LineNr.fg, gui = "underline", guisp = colors.gray },

		WhichKeyBorder { FloatBorder },

		LspSignatureActiveParameter { HlArgs, gui = "underline" },
		LspInlayHint { fg = colors.black.lighten(50), gui = "italic" },

		AerialConstant { Constant },
		AerialFunction { Function },
		AerialStruct { Type },
		AerialField { Field },
		AerialMethod { Function },
		AerialModule { PreProc },
		AerialLine { CursorLine },

		UndotreeBranch { fg = colors.purple },

		sym("@lsp.type.class") { Type },
		sym("@lsp.type.comment") { Comment },
		sym("@lsp.type.decorator") { PreProc },
		sym("@lsp.type.enum") { Type },
		sym("@lsp.type.enumMember") { Field },
		sym("@lsp.type.event") { Type },
		sym("@lsp.type.function") {},
		sym("@lsp.type.interface") { Type },
		sym("@lsp.type.keyword") {},
		sym("@lsp.type.macro") { Constant },
		sym("@lsp.type.method") { Function },
		sym("@lsp.type.modifier") { Type },
		sym("@lsp.type.namespace") { fg = colors.white.darken(20), gui = "italic" },
		sym("@lsp.type.number") { Number },
		sym("@lsp.type.operator") { Operator },
		sym("@lsp.type.parameter") { Parameter },
		sym("@lsp.type.property") { Field },
		sym("@lsp.type.regexp") { fg = colors.orange },
		sym("@lsp.type.string") {},
		sym("@lsp.type.struct") { Type },
		sym("@lsp.type.type") { Type },
		sym("@lsp.type.typeParameter") { Type },
		sym("@lsp.type.variable") {},

		sym("@lsp.mod.abstract") {},
		sym("@lsp.mod.async") {},
		sym("@lsp.mod.declaration") {},
		sym("@lsp.mod.defaultLibrary") {},
		sym("@lsp.mod.definition") {},
		sym("@lsp.mod.deprecated") { Comment },
		sym("@lsp.mod.documentation") {},
		sym("@lsp.mod.modification") {},
		sym("@lsp.mod.readonly") {},
		sym("@lsp.mod.static") {},

		sym("@lsp.typemod.type") { Type },
		sym("@lsp.typemod.method") { sym("@lsp.type.method") },
		sym("@lsp.typemod.definition") {},
		sym("@lsp.typemod.variable.readonly") {},
		sym("@lsp.typemod.type.defaultLibrary") {},
		sym("@lsp.typemod.function.defaultLibrary") { FuncBuiltin },

		sym("@type.builtin") { Type },
		sym("@keyword.import") { PreProc },
		sym("@module") { sym("@lsp.type.namespace") },
		sym("@variable.member") { Field },
		sym("@variable.parameter") { Parameter },
		sym("@function.builtin") { FuncBuiltin },
		sym("@property") { Field },
		sym("@type.variable") { Field },
		sym("@constructor") { Type },

		sym("@lsp.type.property.lua") {},

		sym("@diff.minus") { diffRemoved },
		sym("@diff.plus") { diffAdded },
		sym("@diff.delta") { diffChanged },
	}
end)

return theme
