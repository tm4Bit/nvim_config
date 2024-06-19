local M = {}

local icons = {
	Array = "",
	ArrowCircleDown = "",
	ArrowCircleLeft = "",
	ArrowCircleRight = "",
	ArrowCircleUp = "",
	ArrowDown = "",
	ArrowLeft = "",
	ArrowRight = "",
	ArrowUp = "",
	Astro = "󰑣",
	BoldClose = "",
	BoldDividerLeft = "",
	BoldDividerRight = "",
	BoldError = "",
	BoldHint = "",
	BoldInformation = "",
	BoldLineLeft = "▎",
	BoldQuestion = "",
	BoldWarning = "",
	Bolt = "󰉁",
	BookMark = "",
	Boolean = "",
	BoxChecked = "",
	Bqf = "󰁨",
	Branch = "",
	Bug = "",
	Calendar = "",
	Cat = "󰄛",
	Check = "",
	ChevronDown = "",
	ChevronLeft = "",
	ChevronRight = "",
	ChevronUp = "",
	Circle = "",
	CircuitBoard = "",
	Class = "",
	Clock = "󰅒",
	Close = "󰅖",
	CloudDownload = "",
	Code = "",
	Codeium = "󰚩",
	Coffe = "",
	Color = "",
	Comment = "",
	Constant = "",
	Constructor = "",
	Copilot = "",
	Dashboard = "",
	Debug = "",
	DebugConsole = "",
	Diff = "",
	DividerLeft = "",
	DividerRight = "",
	DoubleChevronRight = "»",
	Ellipsis = "",
	EmptyFolder = "",
	EmptyFolderOpen = "",
	Enum = "",
	EnumMember = "",
	Env = "",
	Error = "",
	Eslint = "",
	Event = "",
	Field = "",
	File = "",
	FileDeleted = "",
	FileIgnored = "◌",
	FileRenamed = "",
	FileStaged = "󰱒",
	FileSymlink = "",
	FileUnmerged = "",
	FileUnstaged = "󰏬",
	FileUntracked = "󰩳",
	Files = "",
	FindFile = "󰈞",
	FindText = "󱎸",
	Fire = "",
	Folder = "",
	FolderOpen = "",
	FolderSymlink = "",
	Forward = "",
	Function = "",
	Gear = "",
	Git = "󰊢",
	GitSignsAdd = "▎",
	GitSignsChange = "▎",
	GitSignsDelete = "󰐊",
	Hint = "󰌶",
	History = "",
	Information = "",
	Interface = "",
	Javascript = "",
	Json = "󰘦",
	Key = "",
	Keyword = "",
	LastIndentMarker = "└",
	Lightbulb = "",
	LineAdded = "",
	LineLeft = "▏",
	LineMiddle = "│",
	LineModified = "",
	LineRemoved = "",
	List = "",
	Lock = "",
	-- Lsp = "󰒋",
	-- Lsp = "",
	Lsp = "",
	Lua = "",
	Markdown = "",
	Method = "",
	Modified = "󰛿",
	Module = "",
	Mustache = "",
	Namespace = "",
	NewFile = "",
	Note = "󰠮",
	Null = "󰟢",
	Number = "",
	Object = "",
	Octoface = "",
	Operator = "",
	Package = "",
	Pencil = "󰏫",
	Plus = "",
	Property = "",
	Question = "",
	Quit = "",
	Reference = "",
	Rename = "",
	Repository = "",
	Robot = "󰚩",
	Scopes = "",
	Search = "",
	Selected = "",
	SignIn = "",
	SignOut = "",
	Smiley = "",
	Snippet = "",
	Spectre = "",
	Squirrel = "",
	Stacks = "",
	String = "",
	Struct = "",
	Tab = "󰌒",
	Table = "",
	Tag = "",
	Telescope = "󰭎",
	Text = "",
	Tilde = "󰜥",
	Trace = "✎",
	Tree = "",
	Triangle = "󰐊",
	TriangleShortArrowDown = "",
	TriangleShortArrowLeft = "",
	TriangleShortArrowRight = "",
	TriangleShortArrowUp = "",
	Trouble = "󱍼",
	TypeParameter = "",
	Typescript = "󰛦",
	Unit = "",
	Value = "",
	Variable = "",
	Vim = "",
	Warning = "",
	Watch = "",
	Watches = "󰂥",
}

M.get_icon = function(kind, padding, fallback)
	local icon = icons[kind]
	if icon then
		return icon .. string.rep(" ", padding or 0)
	end
	if fallback then
		return fallback .. string.rep(" ", padding or 0)
	end
	return ""
end

return M
