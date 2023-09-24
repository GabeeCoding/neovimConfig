vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

function sudox()
	local current_file = vim.fn.expand('%')
	local command = 'w !SUDO_ASKPASS=`which ssh-askpass` sudo tee ' .. current_file .. ' >/dev/null' -- Write with sudo
	vim.cmd(command)
	vim.cmd('q!')
end

function sudow()
	local current_file = vim.fn.expand('%')
	local command = 'w !SUDO_ASKPASS=`which ssh-askpass` sudo tee ' .. current_file .. ' >/dev/null' -- Write with sudo
	vim.cmd(command)
	vim.cmd("edit!")
end

vim.cmd("command! Xx :lua sudox()")
vim.api.nvim_set_keymap('c', 'w!!', ':lua sudow()<CR>', { noremap = true, silent = true })

--<Leader>q to quit terminal mode
vim.api.nvim_set_keymap("t", "<Leader>q", "<C-\\><C-n>", { noremap = true, silent = true })

vim.cmd("command! -nargs=0 STT lua convert_spaces_to_tabs()")

-- The convert_spaces_to_tabs function remains the same as you provided
function convert_spaces_to_tabs()
	-- Get the current buffer handle
	local buf = vim.api.nvim_get_current_buf()

	-- Get the lines from the current buffer
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

	-- Replace 4 spaces with a tab in each line
	for i, line in ipairs(lines) do
		lines[i] = line:gsub("	", "\t")
	end

	-- Set the modified lines back to the buffer
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
end

--clear entire buffer
vim.api.nvim_set_keymap("n", "<Leader>c", "ggdG", { noremap = true, silent = true })

vim.cmd("set termguicolors")

function colorschemeKeymap(keyCombo, name, trueColor)
	vim.api.nvim_set_keymap("n", "<Leader>t" .. keyCombo, (trueColor and ":set termguicolors<CR>" or ":set notermguicolors<CR>") .. ":colorscheme " .. name .. "<CR>", { noremap = true, silent = true })
end

local themes = {
	{
		name = "default",
		friendlyName = "Default",
		trueColor = false,
		combo = "0",
	},
	{
		name = "roblox",
		friendlyName = "Roblox Studio",
		trueColor = true,
		combo = "1",
	},
	{
		name = "monochrome",
		friendlyName = "Monochrome",
		trueColor = true,
		combo = "2",
	},
	{
		name = "notepad",
		friendlyName = "Notepad++",
		trueColor = true,
		combo = "3",
	},
	{
		name = "red",
		friendlyName = "Red",
		trueColor = true,
		combo = "4",
	},
	{
		name = "habamax",
		friendlyName = "Habamax",
		trueColor = false,
		combo = "5",
	},
	{
		name = "ayu-mirage",
		friendlyName = "Red",
		trueColor = true,
		combo = "6",
	},
	{
		name = "abyss",
		friendlyName = "Abyss",
		trueColor = true,
		combo = "7",
	},
	{
		name = "doubletrouble",
		friendlyName = "Double Trouble",
		trueColor = true,
		combo = "8"
	}
}

for _, theme in ipairs(themes) do
	colorschemeKeymap(theme.combo, theme.name, theme.trueColor)
end

--[[
vim.api.nvim_set_keymap("n", "<Leader>t0", ":set notermguicolors<CR>:colorscheme default<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>t1", ":set termguicolors<CR>:colorscheme roblox<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>t2", ":set termguicolors<CR>:colorscheme monochrome<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>t3", ":set termguicolors<CR>:colorscheme notepad<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>t4", ":set notermguicolors<CR>:colorscheme darkblue<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>t5", ":set notermguicolors<CR>:colorscheme habamax<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>t6", ":set termguicolors<CR>:colorscheme red<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>t7", ":set termguicolors<CR>:colorscheme doubletrouble<CR>", { noremap = true, silent = true })
]]

--[[
we got lsp now
vim.cmd(
inoremap <expr><Tab> CheckBackspace() ? "\<Tab>" : "\<C-n>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
)
]]

vim.keymap.set("n", "<Leader>ee", vim.cmd.Ex)
