local k = vim.api.nvim_set_keymap;
local opts = { silent = true };
return {
	k('n', '<S-o>', 'o<Esc>', opts),
	-- Resize with Arrows
	k('n', '<C-Up>', ':resize -2<CR>', opts),
	k('n', '<C-Down>', ':resize +2<CR>', opts),
	k('n', '<C-Left>', ':vertical resize -2<CR>', opts),
	k('n', '<C-Right>', ':vertical resize +2<CR>', opts),

	-- Resize
	k('n', '<C-h>', '<C-w>h', opts),
	k('n', '<C-j>', '<C-w>j', opts),
	-- don't work. C-k is already used somewhere else?
	k('n', '<C-k>', '<C-w>k', opts),
	k('n', '<C-l>', '<C-w>l', opts),

	k('n', '<zz>', ':wq!', opts),

	-- move
	k("v", "J", ":m '>+1<CR>gv=gv", opts),
	k("v", "K", ":m '<-2<CR>gv=gv", opts),

	-- prevents the register from being overwritten by the replaced section by yanking the section in the void register
	k("x", "<leader>p", "\"_dP", opts),
	-- moves copied text to the system clipboard
	k("n", "<leader>y", "\"+y", opts),
	k("v", "<leader>y", "\"+y", opts),
	k("n", "<leader>y", "\"+Y", opts),
	k("n", "<leader>d", "\"+_d", opts),
	k("v", "<leader>d", "\"+_d", opts),
	k('n', '<leader>f', '":Format<CR>"', opts)

}
