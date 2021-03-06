local colors = require("lush_theme.colors")

local hsl = require("lush").hsl
local colors = {
    black = hsl("#181818"),
    white = hsl("#f8f8f8"),
    red = hsl("#ab4642"),
    orange = hsl("#dc9656"),
    yellow = hsl("#f7ca88"),
    green = hsl("#a1b56c"),
    blue = hsl("#7cafc2"),
    cyan = hsl("#87c1b9"),
    purple = hsl("#ba8baf"),
}

local theme = require("lush")(function()
    return {
        Normal                         { bg = "none" }, -- Normal text
        NormalNC                       { bg = "none" }, -- normal text in non-current windows
        NormalFloat                    { bg = colors.black }, -- Normal text in floating windows.
        Comment                        { fg = colors.black.lighten(25), gui = "italic" }, -- Any comment
        FloatBorder                    { fg = NormalFloat.bg.lighten(30), bg = "none" },
        -- Conceal                     { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
        -- Cursor                      { }, -- Character under the cursor
        -- lCursor                     { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM                    { }, -- Like Cursor, but used when in IME mode |CursorIM|
        CursorLine                     { bg = colors.black.lighten(4) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        CursorColumn                   { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        ColorColumn                    { CursorLine }, -- Columns set with 'colorcolumn'
        VertSplit                      { fg = "none", bg = colors.black.lighten(10) }, -- Column separating vertically split windows
        Directory                      { fg = colors.white }, -- Directory names (and other special names in listings)
        DiffAdd                        { fg = colors.green.lighten(25), bg = colors.green.darken(75) }, -- Diff mode: Added line |diff.txt|
        diffAdded                      { fg = colors.green },
        DiffChange                     { fg = colors.blue.lighten(25), bg = colors.blue.darken(75) }, -- Diff mode: Changed line |diff.txt|
        diffChanged                    { fg = colors.blue },
        DiffDelete                     { fg = colors.red.lighten(25), bg = colors.red.darken(75) }, -- Diff mode: Deleted line |diff.txt|
        diffDelete                     { fg = colors.red },
        diffRemoved                    { fg = colors.red },
        DiffText                       { fg = colors.blue.lighten(50), bg = DiffChange.bg, gui = "bold" }, -- Diff mode: Changed text within a changed line |diff.txt|
        EndOfBuffer                    { Normal }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        -- TermCursor                  { }, -- Cursor in a focused terminal
        -- TermCursorNC                { }, -- Cursor in an unfocused terminal
        ErrorMsg                       { fg = colors.red }, -- Error messages on the command line
        Folded                         { }, -- Line used for closed folds
        IncSearch                      { fg = colors.black, bg = colors.yellow, gui = "bold"}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        Search                         { CursorLine }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        Substitute                     { bg = colors.orange, fg = colors.black }, -- |:substitute| replacement text highlighting
        LineNr                         { fg = colors.black.lighten(20), bg = colors.black.lighten(7) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        SignColumn                     { LineNr }, -- Column where |signs| are displayed
        FoldColumn                     { SignColumn, fg = SignColumn.fg.lighten(25) }, -- 'foldcolumn'
        CursorLineNr                   { fg = colors.white, bg = LineNr.bg, gui = "bold" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        MatchParen                     { CursorLine }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        -- ModeMsg                     { }, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea                     { }, -- Area for messages and cmdline
        -- MsgSeparator                { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg                        { fg = colors.green, gui = "bold,italic" }, -- |more-prompt|
        NonText                        { Comment, gui = "none" }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Pmenu                          { fg = "none", bg = colors.black.lighten(15) }, -- Popup menu: Normal item.
        PmenuSel                       { bg = Pmenu.bg.lighten(10) }, -- Popup menu: Selected item.
        PmenuSbar                      { bg = Pmenu.bg.darken(20) }, -- Popup menu: Scrollbar.
        PmenuThumb                     { bg = Pmenu.bg.lighten(75) }, -- Popup menu: Thumb of the scrollbar.
        DocMenu                        { bg = Pmenu.bg },
        Question                       { fg = colors.green, gui = "bold,italic" }, -- |hit-enter| prompt and yes/no questions
        -- QuickFixLine                { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        SpecialKey                     { fg = colors.orange }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        SpellBad                       { sp = colors.red, gui = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellCap                       { sp = colors.blue, gui = "underdot" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellLocal                     { sp = colors.cyan, gui = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellRare                      { sp = colors.purple, gui = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        StatusLine                     { CursorLine }, -- Status line of current window
        StatusLineNC                   { NormalNC }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        -- TabLine                     { }, -- Tab pages line, not active tab page label
        -- TabLineFill                 { }, -- Tab pages line, where there are no labels
        -- TabLineSel                  { }, -- Tab pages line, active tab page label
        Title                          { fg = colors.blue }, -- Titles for output from ":set all", ":autocmd" etc.
        Visual                         { fg = "none", bg = colors.black.lighten(10) }, -- Visual mode selection
        -- VisualNOS                   { }, -- Visual mode selection when vim is "Not Owning the Selection".
        WarningMsg                     { fg = colors.yellow }, -- Warning messages
        Whitespace                     { fg = colors.red, bg = colors.red }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        -- Winseparator                { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        WildMenu                       { Pmenu }, -- Current match in 'wildmenu' completion

        Constant                       { fg = colors.red, gui = "bold" }, -- (*) Any constant
        String                         { fg = colors.green }, --   A string constant: "this is a string"
        Character                      { fg = colors.red }, --   A character constant: 'c', '\n'
        Number                         { fg = colors.orange }, --   A number constant: 234, 0xff
        Boolean                        { fg = colors.orange }, --   A boolean constant: TRUE, false
        Float                          { fg = colors.orange }, --   A floating point constant: 2.3e10

        Identifier                     { fg = colors.purple }, -- (*) Any variable name
        Function                       { fg = colors.blue }, --   Function name (also: methods for classes)

        Statement                      { fg = colors.purple, gui = "italic" }, -- (*) Any statement
        Keyword                        { Statement }, --   any other keyword
        Operator                       { fg = colors.purple }, --   "sizeof", "+", "*", etc.
        -- Conditional                 { }, --   if, then, else, endif, switch, etc.
        Repeat                         { fg = colors.yellow, gui = "italic" }, --   for, do, while, etc.
        -- Label                       { }, --   case, default, etc.
        Exception                      { fg = colors.red, gui = "italic" }, --   try, catch, throw

        PreProc                        { fg = colors.blue, gui = "italic" }, -- (*) Generic Preprocessor
        -- Include                     { }, --   Preprocessor #include
        -- Define                      { }, --   Preprocessor #define
        -- Macro                       { }, --   Same as Define
        -- PreCondit                   { }, --   Preprocessor #if, #else, #endif, etc.

        Type                           { fg = colors.yellow }, -- (*) int, long, char, etc.
        -- StorageClass                { }, --   static, register, volatile, etc.
        -- Structure                   { }, --   struct, union, enum, etc.
        -- Typedef                     { }, --   A typedef

        Special                        { fg = colors.orange }, -- (*) Any special symbol
        -- SpecialChar                 { }, --   Special character in a constant
        -- Tag                         { }, --   You can use CTRL-] on this
        -- Delimiter                   { }, --   Character that needs attention
        -- SpecialComment              { }, --   Special things inside a comment (e.g. '\n')
        -- Debug                       { }, --   Debugging statements

        Underlined                     { fg = "none", gui = "underline" }, -- Text that stands out, HTML links
        Ignore                         { Comment }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
        Error                          { fg = colors.red, gui = "bold" }, -- Any erroneous construct
        Todo                           { fg = colors.black, bg = colors.cyan, gui = "bold" }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        LspReferenceText               { }, -- Used for highlighting "text" references
        LspReferenceWrite              { CursorLine }, -- Used for highlighting "write" references
        LspReferenceRead               { CursorLine }, -- Used for highlighting "read" references
        -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
        -- LspCodeLensSeparator        { } , -- Used to color the separator between two or more code lens.
        -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

        DiagnosticError                { fg = colors.red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticWarn                 { fg = colors.yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticInfo                 { fg = colors.blue }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticHint                 { fg = colors.white }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticVirtualTextError     { fg = DiagnosticError.fg, bg = DiagnosticError.fg.darken(70), gui = "italic" }, -- Used for "Error" diagnostic virtual text.
        DiagnosticVirtualTextWarn      { fg = DiagnosticWarn.fg, bg = DiagnosticWarn.fg.darken(70), gui = "italic" }, -- Used for "Warn" diagnostic virtual text.
        DiagnosticVirtualTextInfo      { fg = DiagnosticInfo.fg, bg = DiagnosticInfo.fg.darken(70), gui = "italic" }, -- Used for "Info" diagnostic virtual text.
        DiagnosticVirtualTextHint      { fg = DiagnosticHint.fg, bg = DiagnosticHint.fg.darken(70), gui = "italic" }, -- Used for "Hint" diagnostic virtual text.
        DiagnosticUnderlineError       { sp = DiagnosticError.fg, gui = "undercurl" }, -- Used to underline "Error" diagnostics.
        DiagnosticUnderlineWarn        { sp = DiagnosticWarn.fg, gui = "underdot" }, -- Used to underline "Warn" diagnostics.
        DiagnosticUnderlineInfo        { sp = DiagnosticInfo.fg, gui = "underdot" }, -- Used to underline "Info" diagnostics.
        DiagnosticUnderlineHint        { sp = DiagnosticHint.fg, gui = "underdot" }, -- Used to underline "Hint" diagnostics.
        -- DiagnosticFloatingError     { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
        -- DiagnosticFloatingWarn      { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingInfo      { } , -- Used to color "Info" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingHint      { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
        DiagnosticSignError            { DiagnosticError, bg = LineNr.bg }, -- Used for "Error" signs in sign column.
        DiagnosticSignWarn             { DiagnosticWarn, bg = LineNr.bg }, -- Used for "Warn" signs in sign column.
        DiagnosticSignInfo             { DiagnosticInfo, bg = LineNr.bg }, -- Used for "Info" signs in sign column.
        DiagnosticSignHint             { DiagnosticHint, bg = LineNr.bg }, -- Used for "Hint" signs in sign column.

        -- TSAttribute                 { } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
        -- TSBoolean                   { } , -- Boolean literals: `True` and `False` in Python.
        -- TSCharacter                 { } , -- Character literals: `'a'` in C.
        -- TSCharacterSpecial          { } , -- Special characters.
        -- TSComment                   { }, -- Line comments and block comments.
        -- TSConditional               { } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
        TSConstant                     { fg = colors.red }, -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
        TSConstBuiltin                 { TSConstant }, -- Built-in constant values: `nil` in Lua.
        TSConstMacro                   { TSConstant }, -- Constants defined by macros: `NULL` in C.
        -- TSDebug                     { } , -- Debugging statements.
        -- TSDefine                    { } , -- Preprocessor #define statements.
        -- TSError                     { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
        -- TSException                 { } , -- Exception related keywords: `try`, `except`, `finally` in Python.
        TSField                        { fg = colors.red }, -- Object and struct fields.
        TSProperty                     { TSField }, -- Same as `TSField`.
        -- TSFloat                     { } , -- Floating-point number literals.
        TSFunction                     { fg = colors.blue, gui = "italic" }, -- Function calls and definitions.
        TSFuncBuiltin                  { fg = colors.cyan, gui = "italic" }, -- Built-in functions: `print` in Lua.
        TSMethod                       { TSFunction }, -- Method calls and definitions.
        -- TSFuncMacro                 { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
        TSInclude                      { } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
        TSKeyword                      { Keyword }, -- Keywords that don't fit into other categories.
        TSKeywordFunction              { Keyword, gui = "none" }, -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
        -- TSKeywordOperator           { } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
        TSKeywordReturn                { Keyword, gui = "italic" }, -- Keywords like `return` and `yield`.
        TSLabel                        { fg = colors.yellow }, -- GOTO labels: `label:` in C, and `::label::` in Lua.
        -- TSNamespace                 { TSField } , -- Identifiers referring to modules and namespaces.
        TSNone                         { fg = colors.white }, -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
        -- TSNumber                    { } , -- Numeric literals that don't fit into other categories.
        -- TSOperator                  { } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
        TSVariable                     { fg = colors.white }, -- Variable names that don't fit into other categories.
        TSParameter                    { fg = colors.orange, gui = "italic" }, -- Parameters of a function.
        TSVariableBuiltin              { fg = colors.yellow, gui = "italic" }, -- Variable names defined by the language: `this` or `self` in Javascript.
        -- TSParameterReference        { } , -- References to parameters of a function.
        -- TSPreProc                   { } , -- Preprocessor #if, #else, #endif, etc.
        -- TSPunctDelimiter            { } , -- Punctuation delimiters: Periods, commas, semicolons, etc.
        -- TSPunctBracket              { } , -- Brackets, braces, parentheses, etc.
        -- TSPunctSpecial              { } , -- Special punctuation that doesn't fit into the previous categories.
        -- TSRepeat                    { } , -- Keywords related to loops: `for`, `while`, etc.
        -- TSStorageClass              { } , -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
        -- TSString                    { } , -- String literals.
        -- TSStringRegex               { } , -- Regular expression literals.
        -- TSStringEscape              { } , -- Escape characters within a string: `\n`, `\t`, etc.
        -- TSStringSpecial             { } , -- Strings with special meaning that don't fit into the previous categories.
        -- TSSymbol                    { } , -- Identifiers referring to symbols or atoms.
        -- TSTag                       { } , -- Tags like HTML tag names.
        -- TSTagAttribute              { } , -- HTML tag attributes.
        -- TSTagDelimiter              { } , -- Tag delimiters like `<` `>` `/`.
        -- TSText                      { } , -- Non-structured text. Like text in a markup language.
        TSStrong                       { gui = "bold" }, -- Text to be represented in bold.
        TSEmphasis                     { TSStrong }, -- Text to be represented with emphasis.
        TSUnderline                    { gui = "underline" }, -- Text to be represented with an underline.
        TSStrike                       { gui = "strikethrough" }, -- Strikethrough text.
        -- TSTitle                     { } , -- Text that is part of a title.
        -- TSLiteral                   { } , -- Literal or verbatim text.
        TSURI                          { gui = "none" }, -- URIs like hyperlinks or email addresses.
        -- TSMath                      { } , -- Math environments like LaTeX's `$ ... $`
        TSTextReference                { fg = colors.red } , -- Footnotes, text references, citations, etc.
        -- TSEnvironment               { } , -- Text environments of markup languages.
        -- TSEnvironmentName           { } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
        -- TSNote                      { } , -- Text representation of an informational note.
        TSWarning                      { WarningMsg }, -- Text representation of a warning note.
        TSDanger                       { Error }, -- Text representation of a danger note.
        TSType                         { Type }, -- Type (and class) definitions and annotations.
        TSTypeBuiltin                  { Type, gui = "italic" }, -- Built-in types: `i32` in Rust.
        TSTypeDefinition               { Type },
        TSConstructor                  { Type },

        OffscreenPopup                 { CursorLine },

        BufferCurrent                  { fg = colors.white, bg = Normal.bg },
        BufferCurrentIcon              { bg = BufferCurrent.bg },
        BufferCurrentMod               { fg = colors.red, bg = BufferCurrent.bg, gui = "italic" },
        BufferCurrentSign              { fg = colors.blue, bg = BufferCurrent.bg },
        BufferCurrentTarget            { fg = colors.purple, bg = BufferCurrent.bg, gui = "bold" },
        BufferVisible                  { fg = BufferCurrent.fg.darken(25), bg = colors.black.lighten(5) },
        BufferVisibleMod               { BufferCurrentMod, bg = BufferVisible.bg },
        BufferVisibleIcon              { bg = BufferVisible.bg },
        BufferVisibleSign              { fg = colors.white.darken(50), bg = BufferVisible.bg },
        BufferVisibleTarget            { fg = colors.purple, bg = BufferVisible.bg, gui = "bold" },
        BufferInactive                 { fg = BufferVisible.fg.darken(50), bg = BufferVisible.bg },
        BufferInactiveMod              { BufferCurrentMod, bg = BufferInactive.bg },
        BufferInactiveIcon             { bg = BufferInactive.bg },
        BufferInactiveSign             { fg = BufferInactive.fg, bg = BufferInactive.bg },
        BufferInactiveTarget           { fg = colors.purple, bg = BufferInactive.bg, gui = "bold" },
        BufferTabpageFill              { bg = colors.black.lighten(4), fg = colors.black.lighten(15) },

        IndentBlanklineChar            { fg = VertSplit.bg },
        IndentBlanklineContextChar     { fg = colors.purple.darken(25).desaturate(50) },
        TreeIndentMarker               { IndentBlanklineChar },

        MarkSignHL                     { fg = colors.red, bg = LineNr.bg, gui = "bold" },

        GitGutterAdd                   { diffAdded, bg = LineNr.bg },
        GitGutterChange                { diffChanged, bg = LineNr.bg },
        GitGutterChangeDelete          { diffChanged, bg = LineNr.bg },
        GitGutterDelete                { diffDelete, bg = LineNr.bg },

        CmpGhostText                   { fg = Comment.fg.darken(10), gui = "none" },
        CmpItemAbbrMatch               { fg = colors.blue, gui = "bold" },
        CmpItemAbbrMatchFuzzy          { fg = CmpItemAbbrMatch.fg.rotate(180) },
        CmpItemAbbrDefault             { fg = colors.white.darken(10) },
        CmpItemMenu                    { fg = Pmenu.bg.lighten(45), gui = "italic" },

        CmpItemKindField               { TSField, gui = "reverse" },
        CmpItemKindProperty            { TSProperty, gui = "reverse" },
        CmpItemKindEvent               { CmpItemMenu },
        CmpItemKindDeprecated          { fg = colors.black.lighten(50), gui = "strikethrough,italic" },

        CmpItemKindText                { fg = colors.white, gui = "reverse" },
        CmpItemKindEnum                { Type, gui = "reverse" },
        CmpItemKindKeyword             { Keyword, gui = "reverse" },

        CmpItemKindConstant            { TSConstant, gui = "reverse" },
        CmpItemKindConstructor         { TSConstant, gui = "reverse" },
        CmpItemKindReference           { TSTextReference, gui = "reverse" },

        CmpItemKindFunction            { TSFunction, gui = "reverse" },
        CmpItemKindStruct              { Type, gui = "reverse" },
        CmpItemKindClass               { Type, gui = "reverse" },
        CmpItemKindModule              { PreProc, gui = "reverse" },
        CmpItemKindOperator            { Operator, gui = "reverse" },

        CmpItemKindVariable            { TSVariable, gui = "reverse" },
        CmpItemKindFile                { CmpItemKindText },

        CmpItemKindUnit                { CmpItemKindText },
        CmpItemKindSnippet             { fg = colors.green, gui = "reverse" },
        CmpItemKindFolder              { fg = colors.cyan, gui = "reverse" },

        CmpItemKindMethod              { TSMethod, gui = "reverse" },
        CmpItemKindValue               { Special, gui = "reverse" },
        CmpItemKindEnumMember          { TSProperty, gui = "reverse" },

        CmpItemKindInterface           { Type, gui = "reverse" },
        CmpItemKindColor               { CmpItemKindText },
        CmpItemKindTypeParameter       { CmpItemKindText },

        TelescopeNormal                { fg = colors.white.darken(50), bg = colors.black },
        TelescopeBorder                { fg = colors.black, bg = colors.black },
        TelescopeTitle                 { TelescopeBorder },
        TelescopePreviewNormal         { bg = colors.black },
        TelescopePreviewBorder         { TelescopeBorder },
        TelescopePreviewTitle          { fg = colors.white, bg = colors.black, gui = "bold" },
        TelescopeMatching              { CmpItemAbbrMatch },
        TelescopeResultsTitle          { TelescopeMatching },
        TelescopeResultsBorder         { TelescopeBorder },
        TelescopePromptNormal          { fg = colors.white, bg = colors.black },
        TelescopePromptTitle           { TelescopeBorder, fg = colors.white.darken(50), gui = "bold" },
        TelescopePromptPrefix          { fg = colors.blue, bg = TelescopeNormal.bg, gui = "bold" },
        TelescopePromptBorder          { TelescopeBorder },
        TelescopeResultsLineNr         { LineNr },
        TelescopeSelection             { fg = colors.white, bg = CursorLine.bg },
        TelescopeSelectionCaret        { fg = colors.yellow, bg = TelescopeNormal.bg },
        TelescopePreviewLine           { CursorLine },
        TelescopeResultsFunction       { CmpItemKindFunction },
        TelescopeResultsClass          { CmpItemKindFunction },
        TelescopeResultsVariable       { CmpItemKindVariable },
        TelescopeResultsConstant       { CmpItemKindConstant },
        TelescopeResultsProperty       { CmpItemKindProperty },

        FidgetTitle                    { fg = colors.white, bg = colors.black },
        FidgetTask                     { fg = colors.blue, bg = colors.black },

        DevIconDefault                 { fg = colors.black.lighten(25) },

        NeoTreeNormal                  { bg = colors.black },
        NeoTreeNormalNC                { bg = colors.black },
        TreeExpander                   { fg = colors.orange },
        TreeModified                   { fg = BufferCurrentMod.fg },
        NeoTreeDirectoryIcon           { Directory },
        NeoTreeRootName                { Directory, gui = "bold,italic" },
        NeoTreeFileIcon                { DevIconDefault },
        NeoTreeGitUntracked            { fg = colors.orange },
        NeoTreeGitConflict             { fg = colors.red },
        NeoTreeGitModified             { diffChanged },
        NeoTreeGitRenamed              { fg = colors.purple },
        NeoTreeGitDeleted              { diffDelete },
        NeoTreeGitAdded                { diffAdded },
        NeoTreeFloatBorder             { NeoTreeNormal, fg = NeoTreeNormal.bg },

        yamlBool                       { Boolean },
        yamlBlockCollectionItemStart   { Special },

        yaraRuleSection                { fg = colors.yellow },
        yaraIdentifier                 { fg = colors.white },

        dockerfileTSKeyword            { Keyword, gui = "none" },

        devIconDockerfile              { fg = colors.blue },
        devIconDefault                 { fg = colors.blue.desaturate(20).darken(10) },

        helpTSURI                      { TSURI },

        rainbowcol1                    { fg = colors.red.saturate(25) },
        rainbowcol2                    { fg = colors.orange.saturate(25) },
        rainbowcol3                    { fg = colors.yellow.saturate(25) },
        rainbowcol4                    { fg = colors.green.saturate(25) },
        rainbowcol5                    { fg = colors.cyan.saturate(25) },
        rainbowcol6                    { fg = colors.blue.saturate(25) },
        rainbowcol7                    { fg = colors.purple.saturate(25) },

        ScrollbarHandle                { bg = colors.black.lighten(15) },
        ScrollbarSearchHandle          { ScrollbarHandle, fg = IncSearch.bg }, -- Inside the scrollbar
        ScrollbarSearch                { fg = IncSearch.bg }, -- Outside the scrollbr
        ScrollbarErrorHandle           { ScrollbarHandle, fg = DiagnosticError.fg },
        ScrollbarError                 { DiagnosticError },
        ScrollbarWarnHandle            { ScrollbarHandle, fg = DiagnosticWarn.fg },
        ScrollbarWarn                  { DiagnosticWarn },
        ScrollbarInfoHandle            { ScrollbarHandle, fg = DiagnosticInfo.fg },
        ScrollbarInfo                  { DiagnosticInfo },
        ScrollbarHintHandle            { ScrollbarHandle, fg = DiagnosticHint.fg },
        ScrollbarHint                  { DiagnosticHint },
        ScrollbarGitAddHandle          { ScrollbarHandle, fg = colors.green },
        ScrollbarGitAdd                { fg = colors.green, bg = "none" },
        ScrollbarGitChangeHandle       { ScrollbarHandle, fg = colors.blue },
        ScrollbarGitChange             { fg = colors.blue, bg = "none" },
        ScrollbarGitDeleteHandle       { ScrollbarHandle, fg = colors.red },
        ScrollbarGitDelete             { fg = colors.red, bg = "none" },
        ScrollbarMiscHandle            { ScrollbarHandle },
        ScrollbarMisc                  { },

        HlSearchLens                   { Comment, gui = "none" },

        -- HopCursor                   { },
        HopUnmatched                   { Comment, gui = "none" },
        -- HopPreview                  { },
        HopNextKey                     { fg = colors.purple.saturate(25), bg = colors.purple.darken(75), gui = "bold" },
        HopNextKey1                    { fg = colors.blue.saturate(25), bg = colors.blue.darken(75), gui = "bold" },
        HopNextKey2                    { fg = colors.cyan.saturate(25), bg = colors.cyan.darken(75), gui = "bold" },

        GitSignsAddLn                  { DiffAdd },
        GitSignsAddInline              { GitSignsAddLn, bg = GitSignsAddLn.bg.lighten(10), gui = "bold" },
        -- GitSignsAddLnInline         { bg = colors.yellow },
        GitSignsDeleteLn               { DiffDelete },
        GitSignsDeleteInline           { GitSignsDeleteLn, bg = GitSignsDeleteLn.bg.lighten(10), gui = "bold" },
        -- GitSignsDeleteLnInline      { GitSignsDeleteLn },
        GitSignsChangeLn               { DiffChange },
        GitSignsChangeInline           { GitSignsChangeLn, bg = GitSignsChangeLn.bg.lighten(10), gui = "bold" },
        -- GitSignsChangeLnInline      { GitSignsChangeLn },

        WinBar                         { bg = colors.black },
        WinBarNC                       { bg = colors.black },

	NavicIconsFile                 { fg = colors.white, bg = colors.black.lighten(8) },
	NavicIconsModule               { TSInclude, bg = colors.black.lighten(8) },
	NavicIconsNamespace            { TSInclude, bg = colors.black.lighten(8) },
	NavicIconsPackage              { TSInclude, bg = colors.black.lighten(8) },
	NavicIconsClass                { Type, bg = colors.black.lighten(8) },
	NavicIconsMethod               { TSFunction, bg = colors.black.lighten(8) },
	NavicIconsProperty             { TSProperty, bg = colors.black.lighten(8) },
	NavicIconsField                { TSField, bg = colors.black.lighten(8) },
	NavicIconsConstructor          { TSConstructor, bg = colors.black.lighten(8) },
	NavicIconsEnum                 { fg = colors.purple, bg = colors.black.lighten(8) },
	NavicIconsInterface            { fg = colors.purple, bg = colors.black.lighten(8) },
	NavicIconsFunction             { TSFunction, bg = colors.black.lighten(8) },
	NavicIconsVariable             { TSVariable, bg = colors.black.lighten(8) },
	NavicIconsConstant             { TSConstant, bg = colors.black.lighten(8) },
	NavicIconsString               { String, bg = colors.black.lighten(8) },
	NavicIconsNumber               { Number, bg = colors.black.lighten(8) },
	NavicIconsBoolean              { Boolean, bg = colors.black.lighten(8) },
	NavicIconsArray                { bg = colors.black.lighten(8) },
	NavicIconsObject               { bg = colors.black.lighten(8) },
	NavicIconsKey                  { bg = colors.black.lighten(8) },
	NavicIconsNull                 { bg = colors.black.lighten(8) },
	NavicIconsEnumMember           { bg = colors.black.lighten(8) },
	NavicIconsStruct               { bg = colors.black.lighten(8) },
	NavicIconsEvent                { bg = colors.black.lighten(8) },
	NavicIconsOperator             { bg = colors.black.lighten(8) },
	NavicIconsTypeParameter        { bg = colors.black.lighten(8) },
        NavicText                      { bg = colors.black.lighten(8) },
        NavicSeparator                 { fg = colors.black.lighten(25), bg = colors.black.lighten(8) },

        HlArgs                         { fg = colors.orange, gui = "italic" },

        UfoMarker                      { FoldColumn, gui = "bold,italic,reverse" },
    }
end)

return theme
