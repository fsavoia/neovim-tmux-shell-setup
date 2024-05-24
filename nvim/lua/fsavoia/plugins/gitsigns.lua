return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			-- keymaps
			vim.keymap.set(
				"n",
				"<leader>gp",
				"<cmd>lua require('gitsigns').preview_hunk()<CR>",
				{ desc = "[G]it [P]review hunk" }
			),
			vim.keymap.set(
				"n",
				"<leader>gt",
				"<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>",
				{ desc = "[G]it [T]oggle current line blame" }
			),
			vim.keymap.set(
				"n",
				"<leader>gi",
				"<cmd>lua require('gitsigns').diffthis()<CR>",
				{ desc = "[G]it D[i]ff this" }
			),
			vim.keymap.set("n", "<leader>gf", "<cmd>Git<CR>", { desc = "[G]it [F]ugitive" }),

			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			current_line_blame_formatter_opts = {
				relative_time = false,
			},
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})
	end,
}
