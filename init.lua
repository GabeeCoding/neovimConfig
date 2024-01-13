require("core.plugins")

--load and init config

--local config = require "config"
local config
local success = xpcall(function()
	config = require("config")
end, function (err)
	print("FAILED TO LOAD CONFIG, STUFF WILL FAIL")
	print("Have you created a config.lua file?")
	--print(err)
end, "config")

if success then
	local theme = config.theme
	if theme and theme.name then
		if theme.trueColor ~= nil then
			if theme.trueColor then
				vim.cmd("set termguicolors")
			else
				vim.cmd("set notermguicolors")
			end
		end
		vim.cmd.colorscheme(theme.name)
	end

	local useBeamCursor = config.useBeamCursor
	if useBeamCursor and useBeamCursor == true then
		vim.opt.guicursor = {
			"a:ver25"
		}
	end

	local leaderKey = config.leaderKey
	if leaderKey then
		vim.g.mapleader = leaderKey
	end

	local lineNumberMode = config.lineNumbers
	if lineNumberMode == "standard" then
		vim.cmd("set norelativenumber")
		vim.cmd("set number")
	elseif lineNumberMode == "relative" then
		vim.cmd("set relativenumber")
		vim.cmd("set number")
	else
		vim.cmd("set norelativenumber")
		vim.cmd("set nonumber")
	end
end
require("core.keymaps")
