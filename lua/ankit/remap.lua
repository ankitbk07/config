vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
local function write_and_next_buffer()
  if vim.bo.modifiable and not vim.bo.readonly and vim.bo.modified then
    vim.cmd('write')
  end
  vim.cmd('bnext')
end

local function write_and_prev_buffer()
  if vim.bo.modifiable and not vim.bo.readonly and vim.bo.modified then
    vim.cmd('write')
  end
  vim.cmd('bprevious')
end

vim.keymap.set('n', '<Tab>', write_and_next_buffer, { silent = true })
vim.keymap.set('n', '<leader-Tab>', write_and_prev_buffer, { silent = true })

-- set omnicompletion to what I actually need
vim.keymap.set('i', "<C-o>c", "<C-x><C-o>", {noremap = true, silent = true})

-- help us to set the code
vim.wo.number=true
vim.wo.relativenumber=true

