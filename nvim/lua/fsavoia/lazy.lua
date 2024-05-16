local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "fsavoia.plugins" }, { import = "fsavoia.plugins.lsp" } }, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- enable transparent background
vim.api.nvim_exec(
	[[
        hi Normal guibg=NONE ctermbg=NONE
        hi NonText guibg=NONE ctermbg=NONE
    ]],
	false
)
--
-- Copilot integration with nvim-copilot
local function SuggestOneWord()
	local suggestion = vim.fn["copilot#Accept"]("")
	local bar = vim.fn["copilot#TextQueuedForInsertion"]()
	return vim.fn.split(bar, [[[ .]\zs]])[1]
end

local map = vim.keymap.set
map("i", "<C-l>", SuggestOneWord, { expr = true, remap = false })

-- disable tabline (:set showtabline=0)
vim.opt.showtabline = 0

vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = require("vim.ui.clipboard.osc52").paste("+"),
		["*"] = require("vim.ui.clipboard.osc52").paste("*"),
	},
}
