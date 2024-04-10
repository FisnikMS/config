return {
	{
		-- 'mcchrish/zenbones.nvim',
		-- 'rebelot/kanagawa.nvim',
	  -- dependencies = { 'rktjmp/lush.nvim' },
    "ellisonleao/gruvbox.nvim",
    lazy = false,
		priority = 1000,
	--	config = function()
		 --	vim.cmd('colorscheme gruvbox')
			--vim.api.nvim_set_hl(0, "normal", { bg = "none" })
    	--vim.api.nvim_set_hl(0, "normalfloat", { bg = "none" })
      --vim.cmd('hi! LineNr guibg=none ctermbg=none')
      --vim.cmd('highlight SignColumn guibg=none ctermbg=none')
      --vim.cmd('highlight Pmenu guibg=none ctermbg=none')
      
   -- end
	},
	{
		-- set lualine as statusline
		'nvim-lualine/lualine.nvim',
		-- see `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = false,
				theme = 'onedark',
				component_separators = '|',
				section_separators = '',
			},
		},
	},
}
