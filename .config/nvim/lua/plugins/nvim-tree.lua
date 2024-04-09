return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		-- lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"muniftanjim/nui.nvim",
		},
		vim.keymap.set("n", "<leader>ft", ":NvimTreeToggle<cr>", { silent = true }),
		config = function()
			vim.g.loaded_netrw = 1;
			vim.g.loaded_netrwPlugin = 1;
			vim.cmd("hi NvimTreeNormal guibg=NONE");
			require("nvim-tree").setup {
				disable_netrw = true,
				hijack_netrw = true,
				--open_on_setup = false,
				open_on_tab = false,
				hijack_cursor = false,
				update_cwd = true,
				hijack_directories = {
					enable = true,
					auto_open = true,
				},
				diagnostics = {
					enable = true,
					icons = {
						hint = "",
						info = "",
						warning = "",
						error = "",
					},
				},
				update_focused_file = {
					enable = true,
					update_cwd = true,
				},
				git = {
					enable = true,
					ignore = true,
					timeout = 500,
				},
				view = {
					width = 30,
					-- hide_root_folder = false,
					side = "left",
					number = false,
					relativenumber = false,
					adaptive_size = true
				},
				actions = {
					open_file = {
						quit_on_open = true
					},
				},
				renderer = {
					highlight_git = true,
					root_folder_modifier = ":t",
					icons = {
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
						},
						glyphs = {
							default = "",
							symlink = "",
							git = {
								unstaged = "",
								staged = "S",
								unmerged = "",
								renamed = "➜",
								deleted = "",
								untracked = "U",
								ignored = "◌",
							},
							folder = {
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
							},
						}
					}
				}

			}
		end,
	}
}
