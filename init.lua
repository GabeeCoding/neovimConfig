require("core.plugins")

--load and init config
local config = require "config"
local theme = config.theme
if theme then
	vim.cmd.colorscheme(theme)
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

require("core.keymaps")
