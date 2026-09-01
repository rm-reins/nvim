local languages = {
	"json", "javascript", "typescript", "tsx", "yaml", "html", "css", "scss",
	"markdown", "markdown_inline", "go", "lua", "vim", "dockerfile", "gitignore",
	"query", "vimdoc", "jsdoc", "python", "prisma", "graphql", "toml", "regex", "http",
}

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")
		treesitter.setup({})
		treesitter.install(languages)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = languages,
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
