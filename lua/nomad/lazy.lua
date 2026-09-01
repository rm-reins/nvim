local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Homebrew keeps readline outside the compiler's default search path. Hererocks
-- needs these paths when it builds the isolated Lua 5.1 used by rockspecs.
for _, prefix in ipairs({
	"/home/linuxbrew/.linuxbrew/opt/readline",
	"/home/linuxbrew/.linuxbrew/opt/ncurses",
}) do
	if vim.uv.fs_stat(prefix) then
		vim.env.CPATH = prefix .. "/include" .. (vim.env.CPATH and ":" .. vim.env.CPATH or "")
		vim.env.LIBRARY_PATH = prefix .. "/lib" .. (vim.env.LIBRARY_PATH and ":" .. vim.env.LIBRARY_PATH or "")
	end
end

require("lazy").setup({ { import = "nomad.plugins" }, { import = "nomad.plugins.lsp" } }, {
	checker = {
		enabled = true,
		notify = true,
	},
	rocks = {
		hererocks = true,
	},
})
