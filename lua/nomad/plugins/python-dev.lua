return {
	-- Python virtual environment support
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", -- DAP Python support
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },
		},
		lazy = false,
		branch = "regexp", -- Use the regexp branch for better performance
		config = function()
			require("venv-selector").setup({
				settings = {
					options = {
						notify_user_on_venv_activation = true,
					},
				},
			})
		end,
		keys = {
			{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Python virtual environment" },
		},
	},

	-- Python DAP (Debug Adapter Protocol)
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local dap_python = require("dap-python")
			
			-- Try to find Python executable in virtual environment
			local python_path = function()
				local venv = vim.env.VIRTUAL_ENV
				if venv then
					return venv .. "/bin/python"
				end
				return "python3" -- fallback
			end
			
			dap_python.setup(python_path())
			
			-- Python-specific DAP configurations
			require("dap").configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					pythonPath = python_path,
				},
				{
					type = "python",
					request = "launch",
					name = "Launch file with arguments",
					program = "${file}",
					args = function()
						local args_string = vim.fn.input("Arguments: ")
						return vim.split(args_string, " ", true)
					end,
					pythonPath = python_path,
				},
			}
		end,
		keys = {
			{ "<leader>dpr", function() require("dap-python").test_method() end, desc = "Debug Python test method" },
			{ "<leader>dpc", function() require("dap-python").test_class() end, desc = "Debug Python test class" },
		},
	},

	-- Enhanced Python syntax and features
	{
		"Vimjas/vim-python-pep8-indent",
		ft = "python",
	},

	-- Python docstring generation
	{
		"kkoomen/vim-doge",
		ft = "python",
		config = function()
			vim.g.doge_doc_standard_python = "google" -- Google-style docstrings
			vim.g.doge_python_settings = {
				single_quotes = false,
			}
		end,
		keys = {
			{ "<leader>dg", "<cmd>DogeGenerate<cr>", desc = "Generate documentation", ft = "python" },
		},
	},

	-- Python-specific auto-completion and snippets
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function(_, opts)
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			
			-- Load Python snippets
			require("luasnip.loaders.from_vscode").lazy_load()
			
			-- Python-specific completion settings
			opts.sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer", keyword_length = 3 },
				{ name = "path" },
			})
			
			return opts
		end,
	},
} 