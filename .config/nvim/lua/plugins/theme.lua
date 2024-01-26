 return { 
  {
    'mcchrish/zenbones.nvim',
    dependencies = {'rktjmp/lush.nvim'},
    priority = 1000,
    config = function()
	  vim.cmd('colorscheme forestbones')
	  vim.api.nvim_set_hl(0, "normal", {bg="none"})
          vim.api.nvim_set_hl(0, "normalfloat", {bg="none"})
    end
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
