return {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				-- Defaults
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
			-- Per filetype configuration
			per_filetype = {
				-- React/React Native optimized settings
				["javascript"] = {
					enable_close = true,
					enable_rename = true,
				},
				["javascriptreact"] = {
					enable_close = true,
					enable_rename = true,
				},
				["typescript"] = {
					enable_close = true,
					enable_rename = true,
				},
				["typescriptreact"] = {
					enable_close = true,
					enable_rename = true,
				},
				["tsx"] = {
					enable_close = true,
					enable_rename = true,
				},
				["jsx"] = {
					enable_close = true,
					enable_rename = true,
				},
				["html"] = {
					enable_close = true,
					enable_rename = true,
				},
				["xml"] = {
					enable_close = true,
					enable_rename = true,
				},
				["vue"] = {
					enable_close = true,
					enable_rename = true,
				},
			},
		})
	end,
} 