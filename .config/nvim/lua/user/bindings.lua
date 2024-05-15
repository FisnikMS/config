local k = vim.api.nvim_set_keymap;
local opts = { noremap = true, silent = true };
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

return {
  k('n', '<S-n>', 'o<Esc>', opts),
  k('n', '<S-m>', 'O<Esc>', opts),
  -- Resize with arrows
  k('n', '<C-Up>', ':resize -2<CR>', opts),
  k('n', '<C-Down>', ':resize +2<CR>', opts),
  k('n', '<C-Left>', ':vertical resize -2<CR>', opts),
  k('n', '<C-Right>', ':vertical resize +2<CR>', opts),

  -- Navigate between windows
  k('n', '<C-h>', '<C-w>h', opts),
  k('n', '<C-j>', '<C-w>j', opts),
  k('n', '<C-k>', '<C-w>k', opts),
  k('n', '<C-l>', '<C-w>l', opts),

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
  vim.keymap.set("n", '<leader>f', function() vim.lsp.buf.format { async = true } end,
    opts),

  k("n", "<leader>w", "<cmd>w!<CR>", opts),
  k("n", "<leader>z", "<cmd>q!<CR>", opts),

  k("n", "<leader>s", "<cmd>split<CR>", opts),
  k("n", "<leader>v", "<cmd>vsplit<CR>", opts),
  k("n", "<S-l>", "<cmd>tabNext<CR>", opts),
  k("n", "<S-h>", "<cmd>tabprevious<CR>", opts),
  k("n", "<leader>tc", "<cmd>tabclose<CR>", opts),
  k("n", "<leader>to", "<cmd>tabonly<CR>", opts),
  k("n", "<leader>ts", "<cmd>tab split<CR>", opts),

  k("n", "<Tab>", "<cmd>bnext<CR>", opts),
  k("n", "<S-Tab>", "<cmd>bprevious<CR>", opts),


}
