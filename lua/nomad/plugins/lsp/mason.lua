return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local tool_installer = require("mason-tool-installer")

		-- Mason UI
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- Ensure these LSP servers are installed
		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls", -- TypeScript / JavaScript
				"html", -- HTML
				"cssls", -- CSS
				"tailwindcss", -- Tailwind CSS
				"lua_ls", -- Lua
				"gopls", -- Go
				"emmet_ls", -- Emmet
				"pyright", -- Python
				"jsonls", -- JSON
				"yamlls", -- YAML
			},
		})

		-- Ensure these tools (formatters, linters) are installed
		tool_installer.setup({
			ensure_installed = {
				"prettier", -- Prettier formatter
				"stylua", -- Lua formatter
				"isort", -- Python import sorter
				"black", -- Python formatter
				"flake8", -- Python linter (standard)
				"pylint", -- Python linter (comprehensive)
				"eslint_d", -- JS/TS linter
				"prettierd", -- Faster prettier
				"biome", -- Ultra-fast JS/TS formatter/linter
			},
		})
	end,
}
