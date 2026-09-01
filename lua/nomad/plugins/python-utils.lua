return {
	-- Python testing support
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python", -- Python adapter
		},
		ft = "python",
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python")({
						dap = { justMyCode = false },
						args = { "--log-level", "DEBUG" },
						runner = "pytest", -- Default to pytest
					}),
				},
			})
		end,
		keys = {
			{ "<leader>tt", function() require("neotest").run.run() end, desc = "Run nearest test", ft = "python" },
			{ "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file tests", ft = "python" },
			{ "<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Debug nearest test", ft = "python" },
			{ "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary", ft = "python" },
			{ "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Show test output", ft = "python" },
		},
	},

	-- Python REPL integration
	{
		"Vigemus/iron.nvim",
		ft = "python",
		config = function()
			local iron = require("iron.core")
			
			iron.setup({
				config = {
					scratch_repl = true,
					repl_definition = {
						python = {
							command = {"python3"},
							format = require("iron.fts.common").bracketed_paste,
						},
					},
					repl_open_cmd = require("iron.view").bottom(40),
				},
				keymaps = {
					send_motion = "<space>sc",
					visual_send = "<space>sc",
					send_file = "<space>sf",
					send_line = "<space>sl",
					send_mark = "<space>sm",
					mark_motion = "<space>mc",
					mark_visual = "<space>mc",
					remove_mark = "<space>md",
					cr = "<space>s<cr>",
					interrupt = "<space>s<space>",
					exit = "<space>sq",
					clear = "<space>cl",
				},
				highlight = {
					italic = true
				},
				ignore_blank_lines = true,
			})
		end,
		keys = {
			{ "<leader>rs", "<cmd>IronRepl<cr>", desc = "Start Python REPL", ft = "python" },
			{ "<leader>rr", "<cmd>IronRestart<cr>", desc = "Restart REPL", ft = "python" },
			{ "<leader>rf", "<cmd>IronFocus<cr>", desc = "Focus REPL", ft = "python" },
			{ "<leader>rh", "<cmd>IronHide<cr>", desc = "Hide REPL", ft = "python" },
		},
	},
} 