return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		branch = "v2.x",
		keys = {
			{
				"<leader>fe",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
				end,
				desc = "Explorer NeoTree (root dir)",
			},
			dependencies = {
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
			},
			{
				"<C-t>",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
				end,
				desc = "Explorer NeoTree (root dir)",
				remap = false,
			},
			dependencies = {
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
			},
			{
				"<leader>fE",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
				end,
				desc = "Explorer NeoTree (cwd)",
			},
			-- {
			-- 	"<leader>b",
			-- 	function()
			-- 		require("neo-tree.command").execute({ toggle = true, source = buffers, position = float })
			-- 	end,
			-- 	desc = "Explorer NeoTree (cwd)",
			-- },
			{ "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
			{ "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
			{ "<leader>b", "<cmd>Neotree toggle show buffers float<CR>", desc = "Show/hide buffers" },
		},
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			if vim.fn.argc() == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		config = {
			popup_border_style = "rounded",
			filesystem = {
				visible = true,
				bind_to_cwd = false,
				follow_current_file = true,
				filtered_items = {
					hide_dotfiles = false,
					hide_hidden = false,
				},
				commands = {
					diff_files = function(state)
						local node = state.tree:get_node()
						local log = require("neo-tree.log")
						state.clipboard = state.clipboard or {}
						if diff_Node and diff_Node ~= tostring(node.id) then
							local current_Diff = node.id
							require("neo-tree.utils").open_file(state, diff_Node, open)
							vim.cmd("vert diffs " .. current_Diff)
							log.info("Diffing " .. diff_Name .. " against " .. node.name)
							diff_Node = nil
							current_Diff = nil
							state.clipboard = {}
							require("neo-tree.ui.renderer").redraw(state)
						else
							local existing = state.clipboard[node.id]
							if existing and existing.action == "diff" then
								state.clipboard[node.id] = nil
								diff_Node = nil
								require("neo-tree.ui.renderer").redraw(state)
							else
								state.clipboard[node.id] = { action = "diff", node = node }
								diff_Name = state.clipboard[node.id].node.name
								diff_Node = tostring(state.clipboard[node.id].node.id)
								log.info("Diff source file " .. diff_Name)
								require("neo-tree.ui.renderer").redraw(state)
							end
						end
					end,
				},
				window = {
					mappings = {
						["h"] = function(state)
							local node = state.tree:get_node()
							if node.type == "directory" and node:is_expanded() then
								require("neo-tree.sources.filesystem").toggle_directory(state, node)
							else
								require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
							end
						end,
						["l"] = function(state)
							local node = state.tree:get_node()
							if node.type == "directory" then
								if not node:is_expanded() then
									require("neo-tree.sources.filesystem").toggle_directory(state, node)
								elseif node:has_children() then
									require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
								end
							else
								state.commands["open"](state)
							end
						end,
						-- ["D"] = function(state)
						-- 	state.commands["copy_node_to_diff"](state, node)
						-- 	require("neo-tree.ui.renderer").redraw(state)
						-- end,
						["D"] = "diff_files",
					},
				},
			},
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function(arg)
						vim.cmd([[
            setlocal relativenumber
            ]])
					end,
				},
			},
		},
	},
}
