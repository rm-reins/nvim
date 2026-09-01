vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "go back to explorer"})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "move slected line down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "move selected line up"})

-- Line duplication (like VS Code Option+Shift+Down/Up)
vim.keymap.set("n", "<A-S-Down>", ":t.<CR>", {desc = "duplicate line down"})
vim.keymap.set("n", "<A-S-Up>", ":t.-1<CR>", {desc = "duplicate line up"})
vim.keymap.set("v", "<A-S-Down>", ":t'><CR>gv", {desc = "duplicate selection down"})
vim.keymap.set("v", "<A-S-Up>", ":t'<-1<CR>gv", {desc = "duplicate selection up"})

-- Alternative keymaps for line duplication (more accessible)
vim.keymap.set("n", "<leader>ld", ":t.<CR>", {desc = "duplicate line down"})
vim.keymap.set("n", "<leader>lu", ":t.-1<CR>", {desc = "duplicate line up"})
vim.keymap.set("v", "<leader>ld", ":t'><CR>gv", {desc = "duplicate selection down"})
vim.keymap.set("v", "<leader>lu", ":t'<-1<CR>gv", {desc = "duplicate selection up"})

vim.keymap.set("x", "<leader>p", [["_dP]], {desc = "swaps the current line with the line that starts the previous section"})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "scroll down half a screen, center cursor in the middle of the line"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "scroll up half a screen, center cursor in the middle of the line"})
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc = "copy from current cursor position to the end of the line"})
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], {desc = "delete without copying" })
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "clear search highlihgts"})

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close current split" })

-- Split navigation (vim-tmux-navigator provides Ctrl+hjkl)
vim.keymap.set("n", "<leader>sw", "<C-w>w", { desc = "switch to next split" })
vim.keymap.set("n", "<leader>sl", "<C-w>l", { desc = "move to right split" })
vim.keymap.set("n", "<leader>sj", "<C-w>j", { desc = "move to split below" })
vim.keymap.set("n", "<leader>sk", "<C-w>k", { desc = "move to split above" })
vim.keymap.set("n", "<leader>sr", "<C-w>r", { desc = "rotate splits" })

-- Resize splits
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "increase split height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "decrease split height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "decrease split width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "increase split width" })

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "open current file in new tab" })

-- Spell checking
vim.keymap.set("n", "<leader>sc", "<cmd>set spell!<CR>", { desc = "Toggle spell checking" })
vim.keymap.set("n", "]s", "]s", { desc = "Next misspelled word" })
vim.keymap.set("n", "[s", "[s", { desc = "Previous misspelled word" })
vim.keymap.set("n", "z=", "z=", { desc = "Spell suggestions" })

-- React/React Native specific keymaps
vim.keymap.set("n", "<leader>rc", "oconsole.log()<Esc>hi", { desc = "Insert console.log" })
vim.keymap.set("n", "<leader>rd", "odebugger;<Esc>", { desc = "Insert debugger statement" })
vim.keymap.set("n", "<leader>rf", ":lua require('telescope.builtin').find_files({search_dirs = {'src/', 'components/', 'screens/', 'navigation/'}})<CR>", { desc = "Find React files" })

-- Quick file creation for React Native
vim.keymap.set("n", "<leader>cs", ":edit src/screens/Screen.tsx<CR>", { desc = "Create new screen" })
vim.keymap.set("n", "<leader>cc", ":edit src/components/Component.tsx<CR>", { desc = "Create new component" })
vim.keymap.set("n", "<leader>ch", ":edit src/hooks/useHook.ts<CR>", { desc = "Create new hook" })
vim.keymap.set("n", "<leader>cu", ":edit src/utils/util.ts<CR>", { desc = "Create new utility" })

-- Package.json shortcuts
vim.keymap.set("n", "<leader>po", ":edit package.json<CR>", { desc = "Open package.json" })
vim.keymap.set("n", "<leader>pe", ":edit .env<CR>", { desc = "Open .env file" })
vim.keymap.set("n", "<leader>pr", ":edit README.md<CR>", { desc = "Open README.md" })

-- Git shortcuts
vim.keymap.set("n", "<leader>gc", ":edit .gitignore<CR>", { desc = "Open .gitignore" })
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })

-- Terminal toggles are now in mobile-dev.lua with <leader>m prefix
