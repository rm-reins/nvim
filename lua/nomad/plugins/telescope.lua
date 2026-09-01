return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"ahmedkhalf/project.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		-- Check if ripgrep is available
		local has_rg = vim.fn.executable("rg") == 1

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				file_ignore_patterns = {
					"node_modules",
					".git",
					".next",
					"build",
					"dist",
					"*.lock",
					"ios/build",
					"android/build",
					"android/app/build",
					".expo",
					".expo-shared",
					"coverage",
					-- Python patterns
					"__pycache__",
					"*.pyc",
					"*.pyo",
					"*.pyd",
					".Python",
					"env",
					"venv",
					".venv",
					"ENV",
					".env",
					".pytest_cache",
					".coverage",
					"htmlcov",
					".tox",
					".mypy_cache",
					"*.egg-info",
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		})

		-- Load extensions safely
		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "projects")

		-- Project.nvim setup
		require("project_nvim").setup({
			detection_methods = { "pattern", "lsp" },
			patterns = { 
				".git", 
				"package.json", 
				"Makefile", 
				"app.json", 
				"metro.config.js",
				"expo.json",
				"next.config.js",
				-- Python patterns
				"setup.py",
				"pyproject.toml",
				"requirements.txt",
				"Pipfile",
				"manage.py", -- Django
				"app.py", -- Flask
			},
			exclude_dirs = { "~/Downloads/*" },
			show_hidden = false,
			silent_chdir = true,
			scope_chdir = "global",
		})

		-- set keymaps
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		
		-- Only set live_grep if ripgrep is available
		if has_rg then
			vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
			vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
			vim.keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find word under cursor" })
		else
			-- Fallback to grep if ripgrep is not available
			vim.keymap.set("n", "<leader>fs", function()
				vim.notify("ripgrep not found. Please install ripgrep for live_grep functionality.", vim.log.levels.WARN)
			end, { desc = "Find string in cwd (ripgrep required)" })
			vim.keymap.set("n", "<leader>fc", function()
				vim.notify("ripgrep not found. Please install ripgrep for grep_string functionality.", vim.log.levels.WARN)
			end, { desc = "Find string under cursor in cwd (ripgrep required)" })
			vim.keymap.set("n", "<leader>fw", function()
				vim.notify("ripgrep not found. Please install ripgrep for grep_string functionality.", vim.log.levels.WARN)
			end, { desc = "Find word under cursor (ripgrep required)" })
		end
		
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find projects" })
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help" })
	end,
}
