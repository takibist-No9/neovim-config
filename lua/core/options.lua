vim.wo.number = true -- Make line numbers default
vim.o.relativenumber = true -- Set relative numberd lines
vim.o.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim.
vim.o.wrap = false -- Display lines as one long line
vim.o.linebreak = true -- Companion to wrap, don't split words
vim.o.mouse = "" -- Unable mouse mode

vim.o.autoindent = true -- Copy indenet from current line when starting new one
vim.o.smartindent = true -- Smart indentaiton
vim.o.smarttab = true -- Enable smart tab behavior
vim.o.ignorecase = true -- Case-insensitive seraching UNLESS \C or capital in search
vim.o.smartcase = true -- Smart case
vim.o.tabstop = 2 -- Show tab as two spaces
vim.o.shiftwidth = 2 -- Indent using two columns
vim.o.softtabstop = 2 -- When using the tab key, treat it like 2 spaces
vim.o.expandtab = true -- Uses spaces instead of tabs

vim.o.splitbelow = true -- Create new horizontal widows below
vim.o.splitright = true -- Create new vertical windows to the right
vim.o.hlsearch = true -- Highlight search
vim.o.incsearch = true -- Incremental search
