return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"<leader>re",
				"<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
				mode = "v",
				desc = "Extract function",
			},
			{
				"<leader>rf",
				"<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
				mode = "v",
				desc = "Extract function to file",
			},
			{
				"<leader>rv",
				"<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
				mode = "v",
				desc = "Extract variable",
			},
			{
				"<leader>ri",
				"<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
				mode = { "n", "v" },
				desc = "Inline variable",
			},
		},
		config = true,
	},
} 