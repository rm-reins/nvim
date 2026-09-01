return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "float",
				close_on_exit = true,
				shell = vim.o.shell,
				float_opts = {
					border = "curved",
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			})

			local Terminal = require("toggleterm.terminal").Terminal

			-- React Native Metro terminal
			local metro_term = Terminal:new({
				cmd = "npx react-native start",
				dir = "git_dir",
				direction = "float",
				float_opts = {
					border = "double",
				},
				display_name = "Metro Bundler",
			})

			-- Expo development terminal  
			local expo_term = Terminal:new({
				cmd = "npx expo start",
				dir = "git_dir", 
				direction = "float",
				float_opts = {
					border = "double",
				},
				display_name = "Expo Dev Server",
			})

			-- iOS Simulator
			local ios_term = Terminal:new({
				cmd = "npx react-native run-ios",
				dir = "git_dir",
				direction = "float",
				float_opts = {
					border = "double",
				},
				display_name = "iOS Simulator",
			})

			-- Android Emulator
			local android_term = Terminal:new({
				cmd = "npx react-native run-android",
				dir = "git_dir",
				direction = "float",
				float_opts = {
					border = "double",
				},
				display_name = "Android Emulator",
			})

			-- Next.js dev server
			local nextjs_term = Terminal:new({
				cmd = "pnpm run dev",
				dir = "git_dir",
				direction = "float",
				float_opts = {
					border = "double",
				},
				display_name = "Next.js Dev Server",
			})

			-- Key mappings for mobile development
			vim.keymap.set("n", "<leader>mt", function() metro_term:toggle() end, { desc = "Toggle Metro bundler" })
			vim.keymap.set("n", "<leader>me", function() expo_term:toggle() end, { desc = "Toggle Expo dev server" })
			vim.keymap.set("n", "<leader>mi", function() ios_term:toggle() end, { desc = "Run iOS simulator" })
			vim.keymap.set("n", "<leader>ma", function() android_term:toggle() end, { desc = "Run Android emulator" })
			vim.keymap.set("n", "<leader>mn", function() nextjs_term:toggle() end, { desc = "Next.js dev server" })
		end,
	},
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("rest-nvim").setup({
				result_split_horizontal = false,
				result_split_in_place = false,
				skip_ssl_verification = false,
				encode_url = true,
				highlight = {
					enabled = true,
					timeout = 150,
				},
				result = {
					show_url = true,
					show_http_info = true,
					show_headers = true,
					formatters = {
						json = "jq",
						html = function(body)
							return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
						end
					},
				},
			})

			vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim", { desc = "Run HTTP request" })
			vim.keymap.set("n", "<leader>rp", "<Plug>RestNvimPreview", { desc = "Preview HTTP request" })
			vim.keymap.set("n", "<leader>rl", "<Plug>RestNvimLast", { desc = "Run last HTTP request" })
		end,
	},
} 