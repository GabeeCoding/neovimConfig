local highlights = require("neo-tree.ui.highlights")

require("neo-tree").setup({
	close_if_last_window = true,
	enable_git_status = true,
	enable_diagnostics = true,
	filesystem = {
		components = {
			icon = function(config, node, state)
				local icon = config.default or " "
				local padding = config.padding or " "
				local highlight = config.highlight or highlights.FILE_ICON

				if node.type == "directory" then
					highlight = highlights.DIRECTORY_ICON
					if node:is_expanded() then
						icon = "-"
					else
						icon = "+"
					end
				elseif node.type == "file" then
					icon = ""
				end
				return {
					text = icon .. padding,
					highlight = highlight,
				}
			end,
		},
		window = {
			mappings = {
				["%"] = {
					"add",
					config = {
						show_path = "relative"
					}
				},
				["x"] = "delete",
			}
		}
	},
})

vim.api.nvim_set_keymap("n", "<C-b>", ":Neotree toggle<CR>", { noremap = true, silent = true })
