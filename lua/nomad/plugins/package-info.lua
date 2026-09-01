return {
	"vuki656/package-info.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	event = { "BufReadPre", "BufNewFile" },
	ft = "json",
	config = function()
		local package_info = require("package-info")
		
		package_info.setup({
			colors = {
				up_to_date = "#3C4048",
				outdated = "#fc514e",
			},
			icons = {
				enable = true,
				style = {
					up_to_date = "|  ",
					outdated = "|  ",
				},
			},
			autostart = true,
			hide_up_to_date = false,
			hide_unstable_versions = false,
		})

		-- Keybindings for package management
		vim.keymap.set("n", "<leader>ns", package_info.show, { desc = "Show dependency versions", silent = true })
		vim.keymap.set("n", "<leader>nc", package_info.hide, { desc = "Hide dependency versions", silent = true })
		vim.keymap.set("n", "<leader>nt", package_info.toggle, { desc = "Toggle dependency versions", silent = true })
		vim.keymap.set("n", "<leader>nu", package_info.update, { desc = "Update dependency on the line", silent = true })
		vim.keymap.set("n", "<leader>nd", package_info.delete, { desc = "Delete dependency on the line", silent = true })
		vim.keymap.set("n", "<leader>ni", package_info.install, { desc = "Install a new dependency", silent = true })
		vim.keymap.set("n", "<leader>np", package_info.change_version, { desc = "Install a different dependency version", silent = true })
	end,
} 