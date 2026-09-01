vim.cmd("let g:netrw_liststyle = 3")

vim.opt.relativenumber = true   -- relative row numbers
vim.opt.number = true   -- display row numbers
vim.opt.scrolloff = 8   -- minimum amount of lines visible on top or bottom on scroll
vim.opt.signcolumn = "yes"  -- show sign column yes/no/auto
vim.opt.clipboard:append("unnamedplus")     -- use system clipboard

-- Tab and indentation settings optimized for JS/TS
vim.opt.tabstop = 2     -- 2 spaces for JS/TS/React (common standard)
vim.opt.expandtab = true    -- on TAB press use spaces (true) or tab character (false)
vim.opt.softtabstop = 2     -- specifies the amount of whitespace to be inserted when the tab key is pressed and removed by backspace
vim.opt.shiftwidth = 2      -- defines the amount of whitespace used for one level of indentation

vim.opt.smartindent = true      -- enables smart indentation (reacts to the sytax/style of the code you are editing)
vim.opt.wrap = true     -- determines if vim will wrap the line when the maximum window width is reached
vim.opt.linebreak = true    -- will enable line break on word boundaries, instead of mid-word

vim.opt.updatetime = 50     -- specifies the time in ms after which vim auto writes changes to the disk

vim.opt.ignorecase = true   -- ignore case when searching
vim.opt.smartcase = true    -- if mixed case included - searchse case-sensitive

vim.opt.guicursor = "n:block-blinkon1"
vim.opt.termguicolors = true    -- if vim shuld use 24-bit true color

vim.opt.splitright = true   -- split vertical window to the right
vim.opt.splitbelow = true   -- split horizontal window to the bottom

-- Additional options for React Native/JS development
vim.opt.conceallevel = 0    -- Show markdown syntax
vim.opt.pumheight = 10      -- Pop up menu height
vim.opt.showmode = false    -- Don't show mode since we have lualine
vim.opt.showtabline = 2     -- Always show tabs
vim.opt.smartcase = true    -- Smart case
vim.opt.timeoutlen = 300    -- Faster key sequence completion
vim.opt.undofile = true     -- Enable persistent undo
vim.opt.writebackup = false -- Don't create backup before overwriting

-- Spell checking setup (native vim)
vim.opt.spell = false       -- Disabled by default, toggle with <leader>s
vim.opt.spelllang = "en_us"

-- Filetype associations for React development
vim.filetype.add({
	extension = {
		jsx = "javascriptreact",
		tsx = "typescriptreact",
	},
})

-- File specific settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "yaml", "html", "css", "scss" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
	end,
})

-- For Python, Go, and other languages that prefer 4 spaces
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python", "go", "lua" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
	end,
})

-- Enable spell checking for markdown and text files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.spell = true
	end,
})

