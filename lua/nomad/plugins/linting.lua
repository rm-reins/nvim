return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Function to check if ESLint config exists
		local function has_eslint_config()
			local config_files = {
				".eslintrc.js",
				".eslintrc.cjs",
				".eslintrc.yaml",
				".eslintrc.yml",
				".eslintrc.json",
				".eslintrc",
				"eslint.config.js",
				"eslint.config.mjs",
				"eslint.config.cjs",
			}
			
			local cwd = vim.fn.getcwd()
			for _, config_file in ipairs(config_files) do
				if vim.fn.filereadable(cwd .. "/" .. config_file) == 1 then
					return true
				end
			end
			
			-- Also check package.json for eslintConfig
			local package_json = cwd .. "/package.json"
			if vim.fn.filereadable(package_json) == 1 then
				local ok, content = pcall(vim.fn.readfile, package_json)
				if ok then
					local package_str = table.concat(content, "\n")
					if package_str:match('"eslintConfig"') then
						return true
					end
				end
			end
			
			return false
		end

		-- Configure linters conditionally
		lint.linters_by_ft = {
			python = { "flake8" }, -- Standard Python linter
			go = { "golangcilint" },
		}

		-- Add ESLint only if config exists
		if has_eslint_config() then
			lint.linters_by_ft.javascript = { "eslint_d" }
			lint.linters_by_ft.typescript = { "eslint_d" }
			lint.linters_by_ft.javascriptreact = { "eslint_d" }
			lint.linters_by_ft.typescriptreact = { "eslint_d" }
		end

		-- Custom lint function with error handling
		local function safe_lint()
			local ft = vim.bo.filetype
			local linters = lint.linters_by_ft[ft]
			
			if not linters then
				return
			end
			
			-- For JS/TS files, double-check ESLint config exists
			if ft:match("javascript") or ft:match("typescript") then
				if not has_eslint_config() then
					return
				end
			end
			
			-- Try to lint with error handling
			local ok, err = pcall(lint.try_lint)
			if not ok then
				-- Silently fail - don't spam user with errors
				vim.schedule(function()
					vim.notify("Linting failed: " .. tostring(err), vim.log.levels.DEBUG)
				end)
			end
		end

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = safe_lint,
		})

		-- Manual lint keymap
		vim.keymap.set("n", "<leader>ln", safe_lint, { desc = "Run linter" })
		
		-- Toggle linting keymap
		vim.keymap.set("n", "<leader>lt", function()
			if lint.linters_by_ft.javascript then
				-- Disable ESLint
				lint.linters_by_ft.javascript = nil
				lint.linters_by_ft.typescript = nil
				lint.linters_by_ft.javascriptreact = nil
				lint.linters_by_ft.typescriptreact = nil
				vim.notify("ESLint disabled", vim.log.levels.INFO)
			else
				-- Enable ESLint if config exists
				if has_eslint_config() then
					lint.linters_by_ft.javascript = { "eslint_d" }
					lint.linters_by_ft.typescript = { "eslint_d" }
					lint.linters_by_ft.javascriptreact = { "eslint_d" }
					lint.linters_by_ft.typescriptreact = { "eslint_d" }
					vim.notify("ESLint enabled", vim.log.levels.INFO)
				else
					vim.notify("No ESLint config found", vim.log.levels.WARN)
				end
			end
		end, { desc = "Toggle ESLint linting" })
	end,
}
