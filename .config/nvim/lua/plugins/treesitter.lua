return {
	{
		--Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
    "nvim-treesitter/nvim-treesitter-angular",
    dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
	}
}
