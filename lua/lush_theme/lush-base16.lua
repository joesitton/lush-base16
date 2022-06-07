local ok, lush = pcall(require, "lush")

if not ok then
    error("Could not load lush: " .. lush)
end

local hsl = lush.hsl

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

local theme = lush(function()
    return {
        Normal       { bg = "none" }, -- Normal text
        NormalFloat  { bg = colors.black }, -- Normal text in floating windows.
        -- NormalNC     { }, -- normal text in non-current windows
        -- Conceal      { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
        -- Cursor       { }, -- Character under the cursor
        -- lCursor      { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
        CursorLine      { bg = colors.black.lighten(10) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        CursorColumn { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        ColorColumn  { CursorLine }, -- Columns set with 'colorcolumn'
        VertSplit    { fg = colors.black.lighten(5), bg = colors.black.lighten(5) }, -- Column separating vertically split windows
        SignColumn   { VertSplit }, -- Column where |signs| are displayed
        -- Directory    { }, -- Directory names (and other special names in listings)
        DiffAdd      { fg = colors.green }, -- Diff mode: Added line |diff.txt|
        DiffChange   { fg = colors.blue }, -- Diff mode: Changed line |diff.txt|
        DiffDelete   { fg = colors.red }, -- Diff mode: Deleted line |diff.txt|
        DiffText     { fg = colors.blue.lighten(50) }, -- Diff mode: Changed text within a changed line |diff.txt|
        EndOfBuffer  { Normal }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        -- TermCursor   { }, -- Cursor in a focused terminal
        -- TermCursorNC { }, -- Cursor in an unfocused terminal
        ErrorMsg     { fg = colors.red }, -- Error messages on the command line
        -- Folded       { }, -- Line used for closed folds
        -- FoldColumn   { }, -- 'foldcolumn'
        Search       { fg = colors.black, bg = colors.yellow }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        IncSearch    { Search }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        -- Substitute   { }, -- |:substitute| replacement text highlighting
        LineNr       { fg = colors.black.lighten(25), bg = VertSplit.bg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        CursorLineNr { fg = colors.white, bg = VertSplit.bg, gui = "bold"  }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        MatchParen   { bg = CursorLine.bg, gui = "underline" }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea      { }, -- Area for messages and cmdline
        -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        -- MoreMsg      { }, -- |more-prompt|
        -- NonText({}), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Pmenu        { fg = "none", bg = colors.black.lighten(15) }, -- Popup menu: Normal item.
        PmenuSel     { bg = Pmenu.bg.lighten(15) }, -- Popup menu: Selected item.
        PmenuSbar    { bg = Pmenu.bg.lighten(10) }, -- Popup menu: Scrollbar.
        PmenuThumb   { bg = Pmenu.bg.lighten(90) }, -- Popup menu: Thumb of the scrollbar.
        DocMenu      { bg = Pmenu.bg },
        -- Question     { }, -- |hit-enter| prompt and yes/no questions
        -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        -- StatusLine   { }, -- Status line of current window
        -- StatusLineNC { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        -- TabLine      { }, -- Tab pages line, not active tab page label
        -- TabLineFill  { }, -- Tab pages line, where there are no labels
        -- TabLineSel   { }, -- Tab pages line, active tab page label
        -- Title        { }, -- Titles for output from ":set all", ":autocmd" etc.
        Visual       { fg = "none", bg = CursorLine.bg }, -- Visual mode selection
        -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
        -- WarningMsg   { }, -- Warning messages
        -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        -- Winseparator { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        -- WildMenu     { }, -- Current match in 'wildmenu' completion

        Comment      { fg = colors.black.lighten(25), gui = "italic" }, -- Any comment

        Constant     { fg = colors.red }, -- (*) Any constant
        String       { fg = colors.green }, --   A string constant: "this is a string"
        -- Character      { }, --   A character constant: 'c', '\n'
        -- Number         { }, --   A number constant: 234, 0xff
        Boolean      { fg = colors.orange }, --   A boolean constant: TRUE, false
        Float        { fg = colors.orange }, --   A floating point constant: 2.3e10

        Identifier     { fg = colors.purple }, -- (*) Any variable name
        Function       { fg = colors.blue }, --   Function name (also: methods for classes)

        Statement      { fg = colors.purple }, -- (*) Any statement
        -- Conditional    { }, --   if, then, else, endif, switch, etc.
        -- Repeat         { }, --   for, do, while, etc.
        -- Label          { }, --   case, default, etc.
        -- Operator       { }, --   "sizeof", "+", "*", etc.
        Keyword        { Statement }, --   any other keyword
        -- Exception      { }, --   try, catch, throw

        PreProc        { fg = colors.blue, gui = "italic" }, -- (*) Generic Preprocessor
        -- Include        { }, --   Preprocessor #include
        -- Define         { }, --   Preprocessor #define
        -- Macro          { }, --   Same as Define
        -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

        Type           { fg = colors.blue }, -- (*) int, long, char, etc.
        -- StorageClass   { }, --   static, register, volatile, etc.
        -- Structure      { }, --   struct, union, enum, etc.
        -- Typedef        { }, --   A typedef

        Special        { fg = colors.orange }, -- (*) Any special symbol
        -- SpecialChar    { }, --   Special character in a constant
        -- Tag            { }, --   You can use CTRL-] on this
        -- Delimiter      { }, --   Character that needs attention
        -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
        -- Debug          { }, --   Debugging statements

        Underlined     { fg = "none", gui = "underline" }, -- Text that stands out, HTML links
        Ignore         { Comment }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
        Error          { fg = colors.red, gui = "bold" }, -- Any erroneous construct
        Todo           { fg = colors.black, bg = colors.cyan, gui = "bold" }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- LspReferenceText            { illuminatedCurWord } , -- Used for highlighting "text" references
        -- LspReferenceWrite           { illuminatedCurWord} , -- Used for highlighting "write" references
        -- LspReferenceRead            { illuminatedWord } , -- Used for highlighting "read" references
        -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
        -- LspCodeLensSeparator        { } , -- Used to color the separator between two or more code lens.
        -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

        -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
        -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
        -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
        -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
        -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
        -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
        -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
        -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
        -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
        -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
        -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
        -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
        -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
        -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

        -- TSAttribute          { } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
        -- TSBoolean            { } , -- Boolean literals: `True` and `False` in Python.
        -- TSCharacter          { } , -- Character literals: `'a'` in C.
        -- TSCharacterSpecial   { } , -- Special characters.
        -- TSComment            { }, -- Line comments and block comments.
        -- TSConditional        { } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
        -- TSConstant           { } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
        -- TSConstBuiltin       { } , -- Built-in constant values: `nil` in Lua.
        -- TSConstMacro         { } , -- Constants defined by macros: `NULL` in C.
        -- TSConstructor        { } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
        -- TSDebug              { } , -- Debugging statements.
        -- TSDefine             { } , -- Preprocessor #define statements.
        -- TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
        -- TSException          { } , -- Exception related keywords: `try`, `except`, `finally` in Python.
        TSField              { fg = colors.white } , -- Object and struct fields.
        -- TSFloat              { } , -- Floating-point number literals.
        -- TSFunction           { } , -- Function calls and definitions.
        TSFuncBuiltin        { fg = colors.blue, gui = "italic" } , -- Built-in functions: `print` in Lua.
        -- TSFuncMacro          { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
        -- TSInclude            { } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
        TSKeyword            { Keyword } , -- Keywords that don't fit into other categories.
        -- TSKeywordFunction    { } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
        -- TSKeywordOperator    { } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
        -- TSKeywordReturn      { } , -- Keywords like `return` and `yield`.
        -- TSLabel              { } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
        -- TSMethod             { } , -- Method calls and definitions.
        -- TSNamespace          { } , -- Identifiers referring to modules and namespaces.
        -- TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
        -- TSNumber             { } , -- Numeric literals that don't fit into other categories.
        -- TSOperator           { } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
        -- TSParameter          { } , -- Parameters of a function.
        -- TSParameterReference { } , -- References to parameters of a function.
        -- TSPreProc            { } , -- Preprocessor #if, #else, #endif, etc.
        TSProperty           { TSField } , -- Same as `TSField`.
        -- TSPunctDelimiter     { } , -- Punctuation delimiters: Periods, commas, semicolons, etc.
        -- TSPunctBracket       { } , -- Brackets, braces, parentheses, etc.
        -- TSPunctSpecial       { } , -- Special punctuation that doesn't fit into the previous categories.
        -- TSRepeat             { } , -- Keywords related to loops: `for`, `while`, etc.
        -- TSStorageClass       { } , -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
        -- TSString             { } , -- String literals.
        -- TSStringRegex        { } , -- Regular expression literals.
        -- TSStringEscape       { } , -- Escape characters within a string: `\n`, `\t`, etc.
        -- TSStringSpecial      { } , -- Strings with special meaning that don't fit into the previous categories.
        -- TSSymbol             { } , -- Identifiers referring to symbols or atoms.
        -- TSTag                { } , -- Tags like HTML tag names.
        -- TSTagAttribute       { } , -- HTML tag attributes.
        -- TSTagDelimiter       { } , -- Tag delimiters like `<` `>` `/`.
        -- TSText               { } , -- Non-structured text. Like text in a markup language.
        -- TSStrong             { } , -- Text to be represented in bold.
        -- TSEmphasis           { } , -- Text to be represented with emphasis.
        -- TSUnderline          { } , -- Text to be represented with an underline.
        -- TSStrike             { } , -- Strikethrough text.
        -- TSTitle              { } , -- Text that is part of a title.
        -- TSLiteral            { } , -- Literal or verbatim text.
        -- TSURI                { } , -- URIs like hyperlinks or email addresses.
        -- TSMath               { } , -- Math environments like LaTeX's `$ ... $`
        -- TSTextReference      { } , -- Footnotes, text references, citations, etc.
        -- TSEnvironment        { } , -- Text environments of markup languages.
        -- TSEnvironmentName    { } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
        -- TSNote               { } , -- Text representation of an informational note.
        TSWarning            { fg = colors.black, bg = colors.yellow, gui = "bold"} , -- Text representation of a warning note.
        TSDanger             { fg = colors.red } , -- Text representation of a danger note.
        -- TSType               { } , -- Type (and class) definitions and annotations.
        -- TSTypeBuiltin        { } , -- Built-in types: `i32` in Rust.
        -- TSVariable           { } , -- Variable names that don't fit into other categories.
        -- TSVariableBuiltin    { } , -- Variable names defined by the language: `this` or `self` in Javascript.

        OffscreenPopup       { CursorLine },

        BufferCurrent        { fg = colors.white, bg = Normal.bg },
        BufferCurrentIcon    { bg = BufferCurrent.bg },
        BufferCurrentMod     { fg = colors.red, bg = BufferCurrent.bg, gui = "italic" },
        BufferCurrentSign    { fg = colors.blue, bg = BufferCurrent.bg },

        BufferVisible        { fg = BufferCurrent.fg.darken(25), bg = colors.black.lighten(5) },
        BufferVisibleMod     { BufferCurrentMod, bg = BufferVisible.bg },
        BufferVisibleIcon    { bg = BufferVisible.bg },
        BufferVisibleSign    { bg = BufferVisible.bg },

        BufferInactive       { fg = BufferVisible.fg.darken(50), bg = BufferVisible.bg },
        BufferInactiveMod    { BufferCurrentMod, bg = BufferInactive.bg },
        BufferInactiveIcon   { bg = BufferInactive.bg },
        BufferInactiveSign   { bg = BufferInactive.bg },

        TelescopeNormal      { fg = colors.white.darken(25), bg = colors.black },
        TelescopeTitle       { TelescopeNormal },
        TelescopeBorder      { TelescopeNormal },

        IndentBlanklineChar  { fg = colors.black.lighten(15) },

        MarkSignHL           { fg = colors.red, bg = VertSplit.bg, gui = "bold,italic"},

        GitGutterAdd         { DiffAdd, bg = VertSplit.bg },
        GitGutterChange      { DiffChange, bg = VertSplit.bg },
        GitGutterChangeDelete { DiffChange, bg = VertSplit.bg },
        GitGutterDelete      { DiffDelete, bg = VertSplit.bg },

        CmpItemAbbrMatch    { fg = colors.blue, bg = "none", gui = "bold" },
        CmpItemAbbrMatchFuzzy { CmpItemAbbrMatch, fg = CmpItemAbbrMatch.fg.lighten(25) },
        CmpItemAbbrDefault { fg = colors.white },
        CmpItemKindVariable { Constant },
        CmpItemKindInterface { Identifier }, 
        CmpItemKindFunction { Function },
        CmpItemKindMethod { Function },
        CmpItemKindSnippet { fg = colors.green },
        CmpItemKindText { fg = colors.white },
        CmpItemKindKeyword { Keyword },
        CmpItemKindProperty { TSProperty },
        CmpItemKindUnit { fg = colors.white },
        CmpItemKindDeprecated { fg = colors.black.lighten(50), gui = "strikethrough,italic"},

        FidgetTitle { fg = colors.white, gui = "italic" },
        FidgetTask { fg = colors.blue }

    }
end)

return theme
