local options = {
	mouse = "a",
	mousemoveevent = true,
	tabstop = 4,
	wrap = false,
	fcs = "eob: ",
	cmdheight = 0,
	number = true,
	scrolloff = 8,
	pumheight = 10,
	shiftwidth = 4,
	confirm = true,
	undofile = true,
	numberwidth = 4,
	hlsearch = true,
	swapfile = false,
	conceallevel = 0,
	showmode = false,
	timeoutlen = 100,
	expandtab = true,
	smartcase = true,
	updatetime = 300,
	ignorecase = true,
	splitbelow = true,
	splitright = true,
	sidescrolloff = 8,
	cursorline = true,
	signcolumn = "yes",
	smartindent = true,
	writebackup = true,
	-- termguicolors = true,
	foldmethod = "manual",
	fileencoding = "utf-8",
	relativenumber = true,
	clipboard = "unnamedplus",
	-- guifont = "monospace:h17",
	completeopt = { "menuone", "noselect" },
}

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
