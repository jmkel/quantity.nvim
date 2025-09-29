local M = {}

local starting_lines = {}
local session_stats = {
	total_added = 0,
	total_removed = 0, 
	net_change = 0, 
	total_changes = 0
}

M.setup = function()
	vim.api.nvim_create_autocmd("BufEnter", {
		callback = function() 

			local count = vim.api.nvim_buf_line_count(0)
			local bufnr = vim.api.nvim_get_current_buf() 
			starting_lines[bufnr] = count
		end
	})	
	vim.api.nvim_create_autocmd("BufWritePost", {
		callback = function()

			local bufnr = vim.api.nvim_get_current_buf() 
			local added_lines = vim.api.nvim_buf_line_count(0) - (starting_lines[bufnr] or 0)
			if added_lines > 0 then 
				session_stats.total_added = session_stats.total_added + added_lines
			else
				session_stats.total_removed = session_stats.total_removed + math.abs(added_lines)
			end
			session_stats.net_change = session_stats.net_change + added_lines
			session_stats.total_changes = session_stats.total_added + session_stats.total_removed
			starting_lines[bufnr] = vim.api.nvim_buf_line_count(0)

		end
	})
	
	vim.api.nvim_create_user_command("QuantityStats", M.show_stats, {})
end

M.show_stats = function()
	vim.notify(string.format(
		"Session: +%d -%d lines (Net: %d)", 
		session_stats.total_added,
		session_stats.total_removed,
		session_stats.total_added - session_stats.total_removed
	))
end

return M	
