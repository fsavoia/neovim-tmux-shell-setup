-- return {
--   "goolord/alpha-nvim",
--   event = "VimEnter",
--   config = function()
--     local alpha = require("alpha")
--     local dashboard = require("alpha.themes.dashboard")
--
--     -- Set header
--     dashboard.section.header.val = {
--       "                                                     ",
--       "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
--       "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
--       "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
--       "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
--       "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
--       "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
--       "                                                     ",
--     }
--
--     -- Set menu
--     dashboard.section.buttons.val = {
--       dashboard.button("e", " > New File", "<cmd>ene<CR>"),
--       dashboard.button("SPC e", " > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
--       dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
--       dashboard.button("SPC fs", " > Find Word", "<cmd>Telescope live_grep<CR>"),
--       dashboard.button("SPC wr", "󰁯 > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
--       dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
--     }
--
--     -- Send config to alpha
--     alpha.setup(dashboard.opts)
--
--     -- Disable folding on alpha buffer
--     vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
--   end,
-- }
return {
	"goolord/alpha-nvim",
	enabled = true,
	event = "VimEnter",
	lazy = true,
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]

		-- local logo = [[
		--                                                 
		--          ████ ██████           █████      ██
		--         ███████████             █████ 
		--         █████████ ███████████████████ ███   ███████████
		--        █████████  ███    █████████████ █████ ██████████████
		--       █████████ ██████████ █████████ █████ █████ ████ █████
		--     ███████████ ███    ███ █████████ █████ █████ ████ █████
		--    ██████  █████████████████████ ████ █████ █████ ████ ██████
		-- ]]

		dashboard.section.header.val = vim.split(logo, "\n")
		dashboard.section.buttons.val = {
			dashboard.button("e", " " .. " Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
			dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("s", " " .. " Find string", ":Telescope live_grep <CR>"),
			dashboard.button("R", " " .. "Restore Session", '<cmd>lua require("persistence").load()<cr>'),
			dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/ <CR>"),
			dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
			dashboard.button("q", " " .. " Quit", ":qa<CR>"),
		}
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.footer.opts.hl = "AlphaFooter"
		dashboard.opts.layout[1].val = 8
		return dashboard
	end,
	config = function(_, dashboard)
		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		require("alpha").setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
