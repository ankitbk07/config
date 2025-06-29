local lspconfig = require("lspconfig")
lspconfig.gopls.setup {}

vim.cmd[[set completeopt+=menuone,noselect,popup]]
vim.lsp.start({
  name = 'gopls',
  cmd = {'gopls'},
  on_attach = function(client, bufnr)
    vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
      convert = function(item)
        return { abbr = item.label:gsub('%b()', '') }
      end,
    })
  end,
})

--local triggers = {'.'}
	--vim.api.nvim_create_autocmd('InsertCharPre', {
	--buffer = vim.api.nvim_get_current_buf(),
	--callback = function()
		--if vim.fn.pumvisible() == 1 then
		--return
		--end
		--local char = vim.v.char
		--if vim.list_contains(triggers, char) then
		--local key = vim.keycode('<C-o>c')
		--vim.api.nvim_feedkeys(key, 'm', false)
		--end
		--end
			--})

vim.api.nvim_create_autocmd('TextChangedI', {
  buffer = vim.api.nvim_get_current_buf(),
  callback = function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local prev_char = line:sub(col, col)
    if prev_char == '.' then
      local key = vim.keycode('<C-o>c')
      vim.api.nvim_feedkeys(key, 'm', false)
    end
  end
})

